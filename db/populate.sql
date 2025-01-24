insert into categories (
  category_name
) values
  ('guruji'),
  ('events'),
  ('community'),
  ('retreats'),
  ('courses');

insert into categories_translations (
  category_name,
  lang_code,
  display_name,
  description,
  rss_slug,
  seo_text
) values
  ('guruji', 'en', 'Guruji', 'Articles about Guruji', 'guruji', ''),
  ('events', 'en', 'Events', 'Articles about event in Bhakti Marga', 'events', ''),
  ('community', 'en', 'Community', 'Community', 'community', ''),
  ('retreats', 'en', 'Retreats', 'Retreats', 'retreats', ''),
  ('courses', 'en', 'Courses', 'Courses', 'courses', '');

insert into authors (
  name,
  short_bio,
  profile_photo_id
) values (
  'Local Author',
  'Local Author bio',
  null
  );



insert into medias (
  media_id,
  media_type,
  url,
  primary_lang_code,
  upload_state
) values (
  gen_random_uuid(),
  'image',
  '/assets/news-01.jpg',
  'en',
  'finished'
  );

insert into articles (
  featured_image_id,
  category_name,
  author_id,
  publish_date,
  is_featured_in_category,
  is_top_story,
  primary_lang_code,
  status
) values (
  (select media_id from medias limit 1),
  'guruji',
  (select max(author_id) from authors),
  '2024-01-11 00:00:00',
  false,
  false,
  'en',
  'published'
  );

insert into articles_translations (
  article_id,
  lang_code,
  handle,
  title,
  excerpt,
  description,
  seo_text,
  -- NOTE: content is an array of content blocks
  content
) values (
  lastval(),
  'en',
  'test-article',
  'Test article',
  'This is an excerpt',
  'Article description for SEO',
  'More text for SEO',
  jsonb_build_array(
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h1>Article content</h1><p>Content here</p>'),
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h2>Next block in content</h2>')
  )
  );

