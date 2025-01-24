import { pgTable, check, uuid, varchar, boolean, text, integer, foreignKey, serial, jsonb, unique, timestamp, primaryKey } from "drizzle-orm/pg-core"
import { sql } from "drizzle-orm"



export const medias = pgTable("medias", {
	mediaId: uuid("media_id").primaryKey().notNull(),
	mediaType: varchar("media_type").notNull(),
	thumbnailUrl: varchar("thumbnail_url", { length: 2048 }),
	url: varchar({ length: 2048 }).notNull(),
	isEmbed: boolean("is_embed").default(false),
	primaryLangCode: text("primary_lang_code"),
	uploadState: varchar("upload_state").notNull(),
	width: integer(),
	height: integer(),
}, (table) => [
	check("medias_media_type_check", sql`(media_type)::text = ANY ((ARRAY['image'::character varying, 'video'::character varying])::text[])`),
	check("medias_upload_state_check", sql`(upload_state)::text = ANY ((ARRAY['staging'::character varying, 'finished'::character varying])::text[])`),
]);

export const authors = pgTable("authors", {
	authorId: serial("author_id").primaryKey().notNull(),
	name: varchar({ length: 512 }),
	shortBio: varchar("short_bio", { length: 1024 }),
	profilePhotoId: uuid("profile_photo_id"),
	socialLinks: jsonb("social_links"),
}, (table) => [
	foreignKey({
			columns: [table.profilePhotoId],
			foreignColumns: [medias.mediaId],
			name: "authors_profile_photo_id_fkey"
		}),
]);

export const mediaTranslations = pgTable("media_translations", {
	mediaTranslationsId: serial("media_translations_id").primaryKey().notNull(),
	mediaId: uuid("media_id").notNull(),
	langCode: text("lang_code").notNull(),
	altText: text("alt_text").notNull(),
	title: text(),
	description: text(),
}, (table) => [
	foreignKey({
			columns: [table.mediaId],
			foreignColumns: [medias.mediaId],
			name: "media_translations_media_id_fkey"
		}).onDelete("cascade"),
	unique("media_id_lang_code_uq").on(table.mediaId, table.langCode),
]);

export const categories = pgTable("categories", {
	categoryName: text("category_name").primaryKey().notNull(),
});

export const categoriesTranslations = pgTable("categories_translations", {
	categoriesTranslationsId: serial("categories_translations_id").primaryKey().notNull(),
	categoryName: text("category_name").notNull(),
	langCode: text("lang_code").notNull(),
	displayName: text("display_name").notNull(),
	description: text().notNull(),
	rssSlug: text("rss_slug").notNull(),
	seoText: text("seo_text"),
}, (table) => [
	foreignKey({
			columns: [table.categoryName],
			foreignColumns: [categories.categoryName],
			name: "categories_translations_category_name_fkey"
		}),
	unique("category_name_lang_code").on(table.categoryName, table.langCode),
]);

export const articles = pgTable("articles", {
	articleId: serial("article_id").primaryKey().notNull(),
	featuredImageId: uuid("featured_image_id"),
	categoryName: text("category_name").notNull(),
	isFeaturedInCategory: boolean("is_featured_in_category").default(false),
	isTopStory: boolean("is_top_story").default(false),
	primaryLangCode: text("primary_lang_code").notNull(),
	status: text().notNull(),
	authorId: integer("author_id").notNull(),
	publishDate: timestamp("publish_date", { withTimezone: true, mode: 'string' }),
	eventUrl: varchar("event_url", { length: 2048 }),
	regionAvailability: jsonb("region_availability"),
}, (table) => [
	foreignKey({
			columns: [table.featuredImageId],
			foreignColumns: [medias.mediaId],
			name: "articles_featured_image_id_fkey"
		}),
	foreignKey({
			columns: [table.categoryName],
			foreignColumns: [categories.categoryName],
			name: "articles_category_name_fkey"
		}),
	foreignKey({
			columns: [table.authorId],
			foreignColumns: [authors.authorId],
			name: "articles_author_id_fkey"
		}),
	check("articles_status_check", sql`status = ANY (ARRAY['draft'::text, 'published'::text])`),
]);

export const articlesTranslations = pgTable("articles_translations", {
	articleId: integer("article_id").notNull(),
	langCode: text("lang_code").notNull(),
	handle: varchar({ length: 512 }).notNull(),
	title: varchar({ length: 512 }).notNull(),
	excerpt: varchar({ length: 512 }),
	description: text(),
	seoText: text("seo_text"),
	content: jsonb(),
	contentRaw: text("content_raw"),
}, (table) => [
	foreignKey({
			columns: [table.articleId],
			foreignColumns: [articles.articleId],
			name: "articles_translations_article_id_fkey"
		}).onDelete("cascade"),
	primaryKey({ columns: [table.articleId, table.langCode], name: "article_id_lang_code"}),
	unique("lang_code_handle_uq").on(table.langCode, table.handle),
]);
