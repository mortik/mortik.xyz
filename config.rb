# encoding: utf-8
# frozen_string_literal: true
Encoding.default_external = 'utf-8'
Time.zone = "Berlin"

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :directory_indexes
activate :sprockets
activate :syntax

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true,
               autolink: true,
               smartypants: true
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'


activate :blog do |blog|
  blog.permalink = "{year}/{title}"
  blog.layout = "layouts/blog"
  blog.default_extension = ".md"
  blog.prefix = "blog"
  blog.permalink = "articles/:year-:month-:day-:title.html"
  # blog.taglink = "categories/:tag.html"
  # blog.tag_template = "category.html"
end

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript

  activate :asset_hash
  activate :relative_assets
end

activate :deploy do |deploy|
  deploy.user = "mortik"
  deploy.build_before = true
  deploy.deploy_method = :rsync
  deploy.host = "mortik.xyz"
  deploy.path = "~/current"
end
