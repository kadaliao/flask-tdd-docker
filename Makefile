build:
	docker-compose up -d --build

test:
	docker-compose exec api python -m pytest "src/tests" -p no:warnings --cov "src" -v
	docker-compose exec api flake8 src
	docker-compose exec api black src --check
	docker-compose exec api isort src --check-only


lint:
	docker-compose exec api black src
	docker-compose exec api isort src

recreate_db:
	docker-compose exec api python manage.py recreate_db

seed_db:
	make recreate_db
	docker-compose exec api python manage.py seed_db
