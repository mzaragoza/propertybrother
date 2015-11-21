# Deploy shortcuts
alias devpush='rake deploy:dev'
alias devlogs='heroku logs -t --app propertybrother-prod'

alias prodpush='rake deploy:prod '
alias prodlogs='heroku logs -t --app propertybrother-dev'

# heroku
alias devconsole='heroku run rails c --app propertybrother-prod'

# Runs non-feature/integration specs first ... if those pass, run feature specs
alias ru='rspec --tag ~type:feature spec/' # Units
alias rf='rspec --tag type:feature spec/'  # Features
alias rj='RAILS_ENV=test rake jasmine:ci'  # Javascripts
alias rall='ru && rf && rj'

alias rff='rspec --fail-fast --tag type:feature spec/'  # Features, with fail-fast
alias rfast='rspec --fail-fast --tag ~js:true spec/'
alias rslow='rspec --fail-fast --tag js:true spec/'

alias prp='git pull --rebase origin master && rall && git push origin master'

# Run tests with coverage report
alias cov="COVERAGE=true ru"

# Git helpers
alias gundo="git reset --soft HEAD~1"
alias goldbranches='for branch in `git branch -r | awk "{print $1}" | grep -v "\->"`
  do echo `git log -1 $branch --pretty=format:"%at:%%$branch%%%cr%%%cn%n"`
  done | column -t -s"%" | sort -nr | cut -d ":" -f 2'

# Vim!
alias shutupvim='rm /var/tmp/*.sw*'

