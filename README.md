# Readme
This is an application which fetches HTMl on enterting Youtube Or Instagram's URL.
For now it can only fetches HTML for single URL at a time.

How to run :

  - Repository Link - https://github.com/spstpl/Converter

  - Clone git repository using https://github.com/spstpl/Converter.git

  - Install Ruby 2.2.1

    > rvm install 2.2.1


  - Install all gems and run command

    > bundle


  - Create Database, run all migrations and seed using following commands


    > rake db:create

    > rake  db:migrate

    > rake db:seed


  - Start rails server

    > rails s

  - URL to active admin is localhost:3000/admin

  - Login into active admin's account using

    > username: admin@example.com |
    > password: password

After login into active admin's account -
  - User can create Article
  - On entering valid URL in article's body the URL get replaced by HTML.

    > Example URL - http://www.youtube.com/watch?v=2BYXBC8WQ5k

  - On create action Article get created by title and html of URL as its body.
