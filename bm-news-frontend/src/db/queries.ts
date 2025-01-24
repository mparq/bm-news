import { drizzle } from "drizzle-orm/node-postgres"
import pg from "pg"
import * as schema from "./schema.ts";
import * as relations from './relations.ts';
import * as dze from "drizzle-orm/expressions";
import { assert } from "$std/assert/assert.ts";
import { getTableColumns } from "drizzle-orm";

const { Pool } = pg;

/**
 * NOTE: this basically creates a singleton connection with a particular Pool
 * for the life of the program.
 */
export const db = drizzle({
	client: new Pool({
		connectionString: Deno.env.get('BM_NEWS_DATABASE_URL')
	}),
	schema: { ...schema, ...relations },
})

export async function querySingleArticle(langCode: string, handle: string) {
	const articles = await db
		.select({
			...getTableColumns(schema.articles),
			...getTableColumns(schema.articlesTranslations)
		})
		.from(schema.articles)
		.leftJoin(schema.articlesTranslations, dze.eq(schema.articles.articleId, schema.articlesTranslations.articleId))
		.where(dze.and(
			dze.eq(schema.articlesTranslations.handle, handle),
			dze.eq(schema.articlesTranslations.langCode, langCode)
		));
	if (!articles || articles.length < 1) {
		return null;
	}
	return articles[0];
}
export type QuerySingleArticle = Awaited<ReturnType<typeof querySingleArticle>>;

export async function queryFrontPage(langCode: string) {
	const topStories = await queryTopStories(langCode);
	const latestStories = await queryLatestStories(langCode);
	return {
		topStories: topStories,
		latestStories: latestStories
	};
}

async function queryTopStories(langCode: string) {
	assert(langCode)
	const articles = await db.
		select({
			...getTableColumns(schema.articles),
			...getTableColumns(schema.articlesTranslations)
		})
		.from(schema.articles)
		.leftJoin(schema.articlesTranslations, dze.eq(schema.articles.articleId, schema.articlesTranslations.articleId))
		.where(
			dze.and(
				dze.eq(schema.articles.isTopStory, true),
				dze.eq(schema.articlesTranslations.langCode, langCode),
				dze.eq(schema.articles.status, 'published')
			)
		)
	return articles;
}

async function queryLatestStories(langCode: string) {
	assert(langCode)
	const articles = await db.
		select({
			...getTableColumns(schema.articles),
			...getTableColumns(schema.articlesTranslations)
		})
		.from(schema.articles)
		.leftJoin(schema.articlesTranslations, dze.eq(schema.articles.articleId, schema.articlesTranslations.articleId))
		.orderBy(dze.desc(schema.articles.publishDate))
		.where(
			dze.and(
				dze.eq(schema.articlesTranslations.langCode, langCode),
				dze.eq(schema.articles.status, 'published')
			)
		)
	return articles;
}
