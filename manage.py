# src/__init__.py

from flask.cli import FlaskGroup

from src import app, db

cli = FlaskGroup(app)


@cli.command("recreate_db")
def recreate_db():
    db.drop_all()
    db.create_all()
    db.session.commit()
    print('♾ 初始化数据库')


if __name__ == "__main__":
    cli()
