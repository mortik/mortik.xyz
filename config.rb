# frozen_string_literal: true

Encoding.default_external = 'utf-8'

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :directory_indexes
activate :syntax

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  activate :minify_css
  activate :minify_javascript

  activate :asset_hash
  activate :relative_assets
end
