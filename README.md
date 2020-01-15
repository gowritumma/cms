# README

This README would normally document whatever steps are necessary to get the
application up and running.
This is a simple Content Management Application. You can create subjects and the corresponding pages in it. Pages will have different content.

Things you may want to cover:

* Ruby version ruby 2.4.1p111
* Rails version Rails 5.1.7

* System dependencies

* Configuration

* Database creation
Database names : cms_development/cms_test/cms_production

* Database initialization
 >rails db:migrate

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
  1. rails db:create
  2. rails db:schema:load
  3. rails db:seed

* rails db:migrate will create the database tables
 Table names:
  admin_users
  subjects
  pages
  sections
