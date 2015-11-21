namespace :maintenance do
  desc "Import most recent database dump from prod"
  task :import_from_prod => :environment do
    puts 'heroku run pg:backups capture --app propertybrother-prod'
    restore_backup 'propertybrother-prod'
  end

  desc "Import most recent database dump forom dev"
  task :import_from_prod => :environment do
    puts 'heroku run pg:backups capture --app propertybrother-dev'
    restore_backup 'propertybrother-dev'
  end

  def path_to_heroku
    ['/usr/local/heroku/bin/heroku', '/usr/local/bin/heroku'].detect {|path| File.exists?(path)}
  end

  def heroku(command, site)
    `GEM_HOME='' BUNDLE_GEMFILE='' GEM_PATH='' RUBYOPT='' #{path_to_heroku} #{command} -a #{site}`
  end

  def restore_backup(site = 'propertybrother-prod')
    dump_file = "#{Rails.root}/tmp/postgres.dump"
    unless File.exists?(dump_file)
      pgbackups_url = heroku('pg:backups public-url -q', site).chomp
      puts "curl -o #{dump_file} #{pgbackups_url}"
      system "curl -o #{dump_file} '#{pgbackups_url}'"
    end
    database_config = YAML.load(File.open("#{Rails.root}/config/database.yml")).with_indifferent_access
    dev_db = database_config[Rails.env]
    system "pg_restore -d #{dev_db[:database]} -c #{dump_file}".gsub(/\s+/,' ')
    puts
    puts "'rm #{dump_file}' to redownload postgres dump."
    puts "Done!"
  end
end



