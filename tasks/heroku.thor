class Heroku < Thor

  desc "setup", "Setup Ruby 1.9.3 and default addons"
  def setup(app_name)
    set_ruby193(app_name)
    set_bundle_env(app_name)
    set_env(app_name)
    set_maintenance_page(app_name)
    add_newrelic_addons(app_name)
    add_campfire_addons(app_name)
  end

  desc "set_maintenance_page", "Set the maintenance page url in env variable"
  def set_maintenance_page(app_name)
    set_env_vars(app_name, "MAINTENANCE_PAGE_URL" => "https://jilion.s3.amazonaws.com/maintenance/maintenance.html")
  end

private

  def set_ruby193(app_name)
    heroku('labs:enable user_env_compile', app_name)
    set_env_vars(app_name, {
      "RUBY_VERSION" => "ruby-1.9.3-p125",
      "PATH"         => "bin:vendor/bundle/ruby/1.9.1/bin:/usr/local/bin:/usr/bin:/bin",
      "GEM_PATH"     => "vendor/bundle/ruby/1.9.1"
    })
  end

  def add_newrelic_addons(app_name)
    heroku("addons:add newrelic:standard", app_name)
    set_env_vars(app_name, "NEW_RELIC_APP_NAME" => app_name)
  end

  def add_campfire_addons(app_name)
    heroku("addons:add deployhooks:campfire", app_name)
    set_env_vars(app_name, {
      "DEPLOYHOOKS_CAMPFIRE_API_KEY" => "902e80d1986be4138f3092d10ee67d468c96d9bf",
      "DEPLOYHOOKS_CAMPFIRE_MESSAGE" => "'[Heroku] {{user}} deployed {{head}} to {{app}} {{url}}'",
      "DEPLOYHOOKS_CAMPFIRE_ROOM"    => "'SV Dev'",
      "DEPLOYHOOKS_CAMPFIRE_SSL"     => "1",
      "DEPLOYHOOKS_CAMPFIRE_URL"     => "jilion"
    })
  end

  def set_env(app_name)
    env = app_name =~ /staging/ ? 'staging' : 'production'
    set_env_vars(app_name, {
      "RACK_ENV"  => env,
      "RAILS_ENV" => env
    })
  end

  def set_bundle_env(app_name)
    set_env_vars(app_name, "BUNDLE_WITHOUT" => "development:test:tools")
  end

  def set_env_vars(app_name, env_vars = {})
    env_vars_string = env_vars.map { |k,v| "#{k}=#{v}" }.join(' ')
    heroku("config:add #{env_vars_string}", app_name)
  end

  def heroku(cmd, app_name)
    `heroku #{cmd} -a #{app_name}`
  end

end