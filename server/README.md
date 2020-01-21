## Install rails
1. `sudo apt-get install curl`
2. `command curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -`
3. `\curl -sSL https://get.rvm.io | bash -s stable --rails`
4. `sudo apt install postgresql-contrib libpq-dev`

## Install Postgres User
1. `sudo su postgres`
2. `psql`
3. `CREATE USER ${username};`
4. `ALTER USER ${username} CREATEDB;`
5. `\q`
6. `exit`

#Q&A
1. `CREATE USER your-ubuntu-account;`
2. `ALTER USER your-ubuntu-account CREATEDB;`

## Install && Run Rails Server
1. `sudo apt install git`
2. `git clone `
3. `cd rails_backend`
4. `sudo apt install rbenv`
5. `sudo rbenv exec gem install bundler`
6. `rbenv rehash`
7. `source ~/.rvm/scripts/rvm`
7. `rvm install ruby 2.6.3`
8. `rvm --default use 2.6.3`
9. `gem install bundler:2.0.2`
10. `bundle`
11. `rails db:setup db:migrate db:seed`
12. `rails s`

## How To Change Port
- `rails s -b 0.0.0.0`  #default port 3000
- if you want run on another port
- `rails s -b 0.0.0.0 -p 3001`

# Debug
## Address already in use - bind(2) for "::1" port 3000 (Errno::EADDRINUSE)
1. sudo rm -rf tmp            //delete `tmp` folder under project folder
2. close the rails terminal
3. `sudo lsof -t -i:3000`
4. `sudo kill -9 {pid}`
5. restart rails

## Server Already Started...&& others
1. remove tmp folder in rails project
2. restart rails

#Update from Git
1. `git pull`
2. `source ~/.rvm/scripts/rvm`
3. `rvm --default use 2.6.3`
4. `bundle`