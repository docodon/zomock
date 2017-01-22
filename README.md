# ZOMOCK

## Installation
		
specs recommended : 
*	ruby 2.3.1 
*	rails 4.2
*	postgresql db.

steps
*   Clone the repo 
*   Add the file PROJECT_ROOT/config/database.yml and PROJECT_ROOT/.env 
*   run command - _bundle install_
*   run command - _rake db:migrate_ 
*   It must set up your development enviornment. But you need to set two variables in .env file [APP_SECRET , ZOMATO_KEY].
* ZOMATO_KEY you can get from [zomato api developers](https://developers.zomato.com/api)
* For APP_SECRET you have to ping me .  

Database.yml

'
		

		default: &default
		  adapter: postgresql
		  encoding: unicode
		  database: [DATABASE_NAME]
		  pool: 5
		  username: [YOUR LOCALHOST ACCOUNT]
		  password: [PASSWORD]
		  timeout: 5000

		development:
		  <<: *default
		  #database: db/development.sqlite3

		test:
		  <<: *default
		  #database: db/test.sqlite3

		production:
		  <<: *default
		  #database: db/production.sqlite3

'


### Project overview 

It is project made by me for the [flockathon 2017](https://www.hackerearth.com/sprints/flockathon/) .
Zomock is an interface made using angularjs , angular material and ruby on rails on top of flockOS .
Proposal is to make zomato app on top of flockOS .


The front end angularjs code is at [repo](https://github.com/docodon/zomock_fe) .
Although angular build is added in this repo as well in public folder .


_**suggestions or collaborations are highly appreciated**_

