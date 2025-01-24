drop schema public cascade;
create schema public;

create table medias (
  -- NOTE: media id should be generated in server and cross-ref
  -- to cdn backend (cloudflare r2 or shopify cdn)
  media_id uuid primary key,
  media_type varchar not null check (media_type in ('image', 'video')),
  thumbnail_url varchar(2048),
  url varchar(2048) not null,
  is_embed boolean default false,
  primary_lang_code text,
  upload_state varchar not null check (upload_state in ('staging', 'finished')),
  width int,
  height int
);

create table authors (
  author_id serial primary key,
  name varchar(512),
  short_bio varchar(1024),
  profile_photo_id uuid references medias(media_id),
  social_links jsonb
);

create table media_translations (
  media_translations_id serial primary key,
  media_id uuid not null references medias(media_id) on delete cascade,
  lang_code text not null,
  alt_text text not null,
  title text,
  description text,
  constraint media_id_lang_code_uq unique(media_id, lang_code)
);

create table categories (
  category_name text primary key
);

create table categories_translations (
  categories_translations_id serial primary key,
  category_name text not null references categories(category_name),
  lang_code text not null,
  display_name text not null,
  description text not null,
  rss_slug text not null,
  seo_text text,
  constraint category_name_lang_code unique(category_name, lang_code)
);

-- postgres schema file
create table articles (
  article_id serial primary key,
  featured_image_id uuid references medias(media_id),
  category_name text not null references categories(category_name),
  -- whether or not the article is featured in the category
  is_featured_in_category boolean default false,
  is_top_story boolean default false,
  primary_lang_code text not null,
  status text not null check (status in ('draft', 'published')),
  author_id integer not null references authors(author_id),
  publish_date timestamptz,
  event_url varchar(2048),
  region_availability jsonb
);

create table articles_translations (
  article_id int not null references articles(article_id) on delete cascade,
  lang_code text not null,
  handle varchar(512) not null,
  title varchar(512) not null,
  excerpt varchar(512),
  description text,
  seo_text text,
  -- NOTE: content is an array of content blocks
  content jsonb,
  content_raw text,
  constraint article_id_lang_code primary key(article_id, lang_code),
  constraint lang_code_handle_uq unique(lang_code, handle)
);


