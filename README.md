# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# DB設計

## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null:false , unique:true , index:true|
|email|string|null:false , unique:true|

### Association
- has_many :projects
- has_many :comments

## profiles table

|Column|Type|Options|
|------|----|-------|
|department|string|null:false|
|age|integer||
|joined_year|date||

### Association
- has_many :projects
- has_many :comments


## projects table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false , foreign_key: true|
|title|string|null:false|
|content|text||
|phase|string|null:false|

### Association
- has_many :comments
- belongs_to :user


## comments table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false , foreign_key: true|
|project_id|references|null: false , foreign_key: true|
|comment|text||

### Association
- belongs_to :user
- has_many :projects