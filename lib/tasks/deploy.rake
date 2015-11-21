namespace :deploy do
  desc "Deploy to production"
  task :prod do
    puts "THIS IS DEPLOYING TO PRODUCTION!!!"
    puts "********* CAREFUL! *********"
    sleep 10
    backup_environment_db("propertybrother-prod")
    deploy_sha_to_environment(ARGV[1], "propertybrother-prod")
    system("https://propertybrother-prod.herokuapp.com/")
  end

  desc "Deploy to development"
  task :dev do
    deploy_sha_to_environment(ARGV[1], "propertybrother-dev")
    system("open https://propertybrother-dev.herokuapp.com/")
  end

  desc "Copy prod to dev"
  task :load_dev do
    Bundler.with_clean_env do
      last_production_backup = `heroku pg:backups public-url --app propertybrother-prod`
      system "heroku pg:backups restore '#{last_production_backup}' DATABASE_URL --app propertybrother-dev --confirm propertybrother-dev"
    end
    puts "Remember to sync S3 assets."
  end

  def backup_environment_db(environment)
    Bundler.with_clean_env do
      system "heroku pg:backups capture --app #{environment}"
    end
  end

  def deploy_sha_to_environment(sha, environment)
    if sha = ARGV[1]
      puts "About to push #{sha} to #{environment}."
      message = `git log --format=%B -n 1 #{sha}`
      puts "#{sha} -- #{message}"
      sleep 2
      Bundler.with_clean_env do
        system "git push --force git@heroku.com:#{environment}.git #{sha}:master"
        system "heroku run rake db:migrate --app #{environment}"
        system "heroku restart --app #{environment}"
      end
    else
      puts
      puts "*** sha required! (pass it as an argument) ***"
      puts
      Rake.application.invoke_task("codeship:statuses")
      exit
    end
  end
end

