-- Current sql file was generated after introspecting the database
-- If you want to run this migration please uncomment this code before executing migrations
/*
CREATE TABLE "medias" (
	"media_id" uuid PRIMARY KEY NOT NULL,
	"media_type" varchar NOT NULL,
	"thumbnail_url" varchar(2048),
	"url" varchar(2048) NOT NULL,
	"is_embed" integer DEFAULT 0,
	"primary_lang_code" text,
	"upload_state" varchar NOT NULL,
	"width" integer,
	"height" integer,
	CONSTRAINT "medias_media_type_check" CHECK ((media_type)::text = ANY ((ARRAY['image'::character varying, 'video'::character varying])::text[])),
	CONSTRAINT "medias_upload_state_check" CHECK ((upload_state)::text = ANY ((ARRAY['staging'::character varying, 'finished'::character varying])::text[]))
);
--> statement-breakpoint
CREATE TABLE "authors" (
	"author_id" serial PRIMARY KEY NOT NULL,
	"name" varchar(512),
	"short_bio" varchar(1024),
	"profile_photo_id" uuid,
	"social_links" jsonb
);
--> statement-breakpoint
CREATE TABLE "media_translations" (
	"media_translations_id" serial PRIMARY KEY NOT NULL,
	"media_id" uuid NOT NULL,
	"lang_code" text NOT NULL,
	"alt_text" text NOT NULL,
	"title" text,
	"description" text,
	CONSTRAINT "media_id_lang_code_uq" UNIQUE("media_id","lang_code")
);
--> statement-breakpoint
CREATE TABLE "categories" (
	"category_name" text PRIMARY KEY NOT NULL
);
--> statement-breakpoint
CREATE TABLE "categories_translations" (
	"categories_translations_id" serial PRIMARY KEY NOT NULL,
	"category_name" text NOT NULL,
	"lang_code" text NOT NULL,
	"display_name" text NOT NULL,
	"description" text NOT NULL,
	"rss_slug" text NOT NULL,
	"seo_text" text,
	CONSTRAINT "category_name_lang_code" UNIQUE("category_name","lang_code")
);
--> statement-breakpoint
CREATE TABLE "articles" (
	"article_id" serial PRIMARY KEY NOT NULL,
	"featured_image_id" uuid,
	"category_name" text NOT NULL,
	"is_featured" integer DEFAULT 0,
	"primary_lang_code" text NOT NULL,
	"status" text NOT NULL,
	"author_id" integer NOT NULL,
	"publish_date" timestamp with time zone,
	"event_url" varchar(2048),
	"region_availability" jsonb,
	CONSTRAINT "articles_status_check" CHECK (status = ANY (ARRAY['draft'::text, 'published'::text]))
);
--> statement-breakpoint
CREATE TABLE "articles_translations" (
	"article_id" integer NOT NULL,
	"lang_code" text NOT NULL,
	"handle" varchar(512) NOT NULL,
	"title" varchar(512) NOT NULL,
	"excerpt" varchar(512),
	"description" text,
	"seo_text" text,
	"content" jsonb,
	"content_raw" text,
	CONSTRAINT "article_id_lang_code" PRIMARY KEY("article_id","lang_code"),
	CONSTRAINT "lang_code_handle_uq" UNIQUE("lang_code","handle")
);
--> statement-breakpoint
ALTER TABLE "authors" ADD CONSTRAINT "authors_profile_photo_id_fkey" FOREIGN KEY ("profile_photo_id") REFERENCES "public"."medias"("media_id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "media_translations" ADD CONSTRAINT "media_translations_media_id_fkey" FOREIGN KEY ("media_id") REFERENCES "public"."medias"("media_id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "categories_translations" ADD CONSTRAINT "categories_translations_category_name_fkey" FOREIGN KEY ("category_name") REFERENCES "public"."categories"("category_name") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "articles" ADD CONSTRAINT "articles_featured_image_id_fkey" FOREIGN KEY ("featured_image_id") REFERENCES "public"."medias"("media_id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "articles" ADD CONSTRAINT "articles_category_name_fkey" FOREIGN KEY ("category_name") REFERENCES "public"."categories"("category_name") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "articles" ADD CONSTRAINT "articles_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "public"."authors"("author_id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "articles_translations" ADD CONSTRAINT "articles_translations_article_id_fkey" FOREIGN KEY ("article_id") REFERENCES "public"."articles"("article_id") ON DELETE cascade ON UPDATE no action;
*/