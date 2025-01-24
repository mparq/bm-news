-- name: GetCategoriesWithTranslated :many
select
  categories.*,
  categories_translations.display_name,
  categories_translations.description
from
    categories
    left join categories_translations on categories.category_name = categories_translations.category_name
where
  categories_translations.lang_code = $1;

-- name: GetCategoryWithTranslated :one
select
  categories.*,
  categories_translations.lang_code,
  categories_translations.display_name,
  categories_translations.description,
  categories_translations.rss_slug,
  categories_translations.seo_text
from
    categories
    left join categories_translations on categories.category_name = categories_translations.category_name
where
  categories_translations.lang_code = $1;

-- name: GetArticlesWithTranslated :many
select
    articles.*,
    articles_translations.handle,
    articles_translations.title,
    articles_translations.excerpt
    -- NOTE: leave off content and long texts which aren't needed in list mode
from articles
left join articles_translations on articles.article_id = articles_translations.article_id
where
  articles_translations.lang_code = $1
;

-- name: GetArticleWithTranslated :one
select
    articles.*,
    articles_translations.handle,
    articles_translations.title,
    articles_translations.excerpt,
    articles_translations.description,
    articles_translations.seo_text,
    articles_translations.content
from articles
left join articles_translations on articles.article_id = articles_translations.article_id
where
  articles.article_id = $1
  and articles_translations.lang_code = $2
;

-- name: CreateArticleTranslation :one
insert into articles_translations (
  article_id,
  lang_code,
  handle,
  title,
  excerpt,
  description,
  seo_text,
  -- NOTE: content is an array of content blocks
  content,
  content_raw
) values (
  $1, $2, $3, $4, $5, $6, $7, $8, $9
  )
returning *;

-- name: CreateArticle :one
insert into articles (
  featured_image_id,
  category_name,
  is_featured,
  primary_lang_code,
  status,
  author_id,
  publish_date,
  region_availability
) values (
  $1, $2, $3, $4, $5, $6, $7, $8
  )
returning *;

-- name: GetAuthors :many
select
  authors.*,
  medias.url as profile_photo_url
from
  authors
  left join medias on authors.profile_photo_id = medias.media_id
;

-- name: GetAuthor :one
select
    authors.*,
    medias.thumbnail_url as profile_photo_thumbnail_url,
    medias.url as profile_photo_url,
    medias.width as profile_photo_width,
    medias.height as profile_photo_height
from
  authors
  left join medias on authors.profile_photo_id = medias.media_id
where author_id = $1;

-- name: CreateAuthor :one
insert into authors (
  name,
  short_bio,
  profile_photo_id
) values (
  $1, $2, $3
  )
returning *;

-- name: GetMedia :one
select * from medias where media_id = $1;

-- name: CreateMedia :one
insert into medias (
  media_id,
  media_type,
  thumbnail_url,
  url,
  is_embed,
  primary_lang_code,
  width,
  height,
  upload_state
) values (
  $1, $2, $3, $4, $5, $6, $7, $8, $9
)
returning *;

