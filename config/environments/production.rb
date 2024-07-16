 # Full error reports are disabled and caching is turned on.
 config.consider_all_requests_local       = false
 config.action_controller.perform_caching = true
 # Ensures that a master key has been made available in either ENV["RAILS_MASTER_KEY"]
 # or in config/master.key. This key is used to decrypt credentials (and other encrypted files).
 # config.require_master_key = true
 # Disable serving static files from the `/public` folder by default since
 # Apache or NGINX already handles this.
 config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
 # Compress JavaScripts and CSS.
 #config.assets.js_compressor = :uglifier
 # config.assets.css_compressor = :sass
 # Disable Rails's static asset server (Apache or nginx will already do this)
 config.serve_static_assets = false
 # Compress JavaScripts and CSS
 config.assets.compress = true

 # Don't fallback to assets pipeline if a precompiled asset is missed
 config.assets.compile = false

 # Generate digests for assets URLs
 config.assets.digest = true

 # Do not fallback to assets pipeline if a precompiled asset is missed.
 config.assets.compile = false

 # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

 # Do not dump schema after migrations.
 config.active_record.dump_schema_after_migration = false
end