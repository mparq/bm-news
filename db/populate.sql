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
  'events',
  (select max(author_id) from authors),
  '2024-02-15 00:00:00',
  true,
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
  content
) values (
  lastval(),
  'en',
  'events-article',
  'Events Article',
  'This is an excerpt for events',
  'Article description for events SEO',
  'More text for events SEO',
  jsonb_build_array(
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h1>Events content</h1><p>Content here</p>'),
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h2>Next block in events content</h2>')
  )
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
  'community',
  (select max(author_id) from authors),
  '2024-03-20 00:00:00',
  false,
  true,
  'en',
  'draft'
  );

insert into articles_translations (
  article_id,
  lang_code,
  handle,
  title,
  excerpt,
  description,
  seo_text,
  content
) values (
  lastval(),
  'en',
  'community-article',
  'Community Article',
  'This is an excerpt for community',
  'Article description for community SEO',
  'More text for community SEO',
  jsonb_build_array(
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h1>Community content</h1><p>Content here</p>'),
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h2>Next block in community content</h2>')
  )
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
  'retreats',
  (select max(author_id) from authors),
  '2024-04-25 00:00:00',
  true,
  true,
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
  content
) values (
  lastval(),
  'en',
  'retreats-article',
  'Retreats Article',
  'This is an excerpt for retreats',
  'Article description for retreats SEO',
  'More text for retreats SEO',
  jsonb_build_array(
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h1>Retreats content</h1><p>Content here</p>'),
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h2>Next block in retreats content</h2>')
  )
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
  'courses',
  (select max(author_id) from authors),
  '2024-05-30 00:00:00',
  false,
  false,
  'en',
  'draft'
  );

insert into articles_translations (
  article_id,
  lang_code,
  handle,
  title,
  excerpt,
  description,
  seo_text,
  content
) values (
  lastval(),
  'en',
  'courses-article',
  'Courses Article',
  'This is an excerpt for courses',
  'Article description for courses SEO',
  'More text for courses SEO',
  jsonb_build_array(
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h1>Courses content</h1><p>Content here</p>'),
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h2>Next block in courses content</h2>')
  )
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
  'events',
  (select max(author_id) from authors),
  '2024-06-10 00:00:00',
  true,
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
  content
) values (
  lastval(),
  'en',
  'events-article-2',
  'Events Article 2',
  'This is an excerpt for events article 2',
  'Article description for events article 2 SEO',
  'More text for events article 2 SEO',
  jsonb_build_array(
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h1>Events content 2</h1><p>Content here for events article 2</p>'),
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h2>Next block in events content 2</h2>'),
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<p>Additional content block for events article 2</p>')
  )
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
  'events',
  (select max(author_id) from authors),
  '2024-07-15 00:00:00',
  false,
  true,
  'en',
  'draft'
  );

insert into articles_translations (
  article_id,
  lang_code,
  handle,
  title,
  excerpt,
  description,
  seo_text,
  content
) values (
  lastval(),
  'en',
  'events-article-3',
  'Events Article 3',
  'This is an excerpt for events article 3',
  'Article description for events article 3 SEO',
  'More text for events article 3 SEO',
  jsonb_build_array(
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h1>Events content 3</h1><p>Content here for events article 3</p>'),
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h2>Next block in events content 3</h2>'),
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<p>Additional content block for events article 3</p>'),
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<p>Another content block for events article 3</p>')
  )
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
  'events',
  (select max(author_id) from authors),
  '2024-08-20 00:00:00',
  true,
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
  content
) values (
  lastval(),
  'en',
  'events-article-4',
  'Events Article 4',
  'This is an excerpt for events article 4',
  'Article description for events article 4 SEO',
  'More text for events article 4 SEO',
  jsonb_build_array(
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h1>Events content 4</h1><p>Content here for events article 4</p>'),
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h2>Next block in events content 4</h2>')
  )
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
  'events',
  (select max(author_id) from authors),
  '2024-09-25 00:00:00',
  false,
  true,
  'en',
  'draft'
  );

insert into articles_translations (
  article_id,
  lang_code,
  handle,
  title,
  excerpt,
  description,
  seo_text,
  content
) values (
  lastval(),
  'en',
  'events-article-5',
  'Events Article 5',
  'This is an excerpt for events article 5',
  'Article description for events article 5 SEO',
  'More text for events article 5 SEO',
  jsonb_build_array(
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h1>Events content 5</h1><p>Content here for events article 5</p>'),
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<h2>Next block in events content 5</h2>'),
    jsonb_build_object('guid', gen_random_uuid(), 'type', 'text', 'content', '<p>Additional content block for events article 5</p>')
  )
  );