require 'slim'
set :slim, :pretty => true

set :site_title, "Let the Computer Do the Work - Static Site Generators"
set :site_url, "http://ssg.chadaltemose.com"
set :site_description, ""
set :site_keywords, "static site generators, codekit, hammer for mac, middleman, wintersmith, markdown, jade, sass, minification"

set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'

set :markdown, :tables => true, :autolink => true, :fenced_code_blocks => true

::Compass.configuration.sass_options = { :line_comments => false }

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end

page "/*", :layout => 'basic'
page "/recipes/*", :layout => "recipe"
page "/recipes/index.html", :layout => "recipe-list"
page "/recipes/tools.html", :layout => "basic"

activate :livereload
activate :directory_indexes

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.user = "chadzilla"
  deploy.host = "chadzilla.com"
  deploy.path = "/home/chadzilla/ssg.chadzilla.com/"
  deploy.after_build = true
end