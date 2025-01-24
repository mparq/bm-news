import { relations } from "drizzle-orm/relations";
import { medias, authors, mediaTranslations, categories, categoriesTranslations, articles, articlesTranslations } from "./schema.ts";

export const authorsRelations = relations(authors, ({one, many}) => ({
	media: one(medias, {
		fields: [authors.profilePhotoId],
		references: [medias.mediaId]
	}),
	articles: many(articles),
}));

export const mediasRelations = relations(medias, ({many}) => ({
	authors: many(authors),
	mediaTranslations: many(mediaTranslations),
	articles: many(articles),
}));

export const mediaTranslationsRelations = relations(mediaTranslations, ({one}) => ({
	media: one(medias, {
		fields: [mediaTranslations.mediaId],
		references: [medias.mediaId]
	}),
}));

export const categoriesTranslationsRelations = relations(categoriesTranslations, ({one}) => ({
	category: one(categories, {
		fields: [categoriesTranslations.categoryName],
		references: [categories.categoryName]
	}),
}));

export const categoriesRelations = relations(categories, ({many}) => ({
	categoriesTranslations: many(categoriesTranslations),
	articles: many(articles),
}));

export const articlesRelations = relations(articles, ({one, many}) => ({
	media: one(medias, {
		fields: [articles.featuredImageId],
		references: [medias.mediaId]
	}),
	category: one(categories, {
		fields: [articles.categoryName],
		references: [categories.categoryName]
	}),
	author: one(authors, {
		fields: [articles.authorId],
		references: [authors.authorId]
	}),
	articlesTranslations: many(articlesTranslations),
}));

export const articlesTranslationsRelations = relations(articlesTranslations, ({one}) => ({
	article: one(articles, {
		fields: [articlesTranslations.articleId],
		references: [articles.articleId]
	}),
}));