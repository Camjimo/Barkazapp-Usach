
scaffold:
	# Your scaffold here
	rails g scaffold Product \
		name:string{255} \
		description:text \
		category:references;

	rails g scaffold Category \
		name:string{255} \
		description:text;

destroy:
	# Your destroy here
	rails d scaffold Product;
	rails d scaffold Category;

migrate:
	rake db:drop:all
	rake db:create
	rake db:migrate
	rake db:seed

redo: destroy scaffold migrate
	rails s
