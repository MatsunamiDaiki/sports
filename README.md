# SPORTS
一緒に観戦したいスポーツに関してオンラインで交流できるようなサイトです。


## 概要
みんなで盛り上がりたいスポーツの試合を投稿しオンラインでコメントができます。

## 制作背景
コロナウイルスの影響で現地でスポーツを観戦できない人のためにオンラインで日本中の人達とスポーツを楽しんでいただきたい。

## 機能
- deviseを用いたログイン、ログアウト機能の実装
- haml/SASS記法と、命名規則BEMを使ったマークアップ
- 投稿、削除、編集機能
- 投稿に対するコメント機能
- active_hashを用いたセレクトタグでスポーツ名を指定
- ajaxを使用したインクリメンタルサーチの実装


## 環境
- Ruby 2.6.5
- Rails 6.0.0

## users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null false|
|email|string|null false, unique true|
|password|string|null false, unique true, length:minimum:7|

### Association
- has_many :comments
- has_many :posts

## posts table
|Column|Type|Options|
|------|----|-------|
|title|string|null false|
|text|string|
|genre_id|integer|null false|

### Association
- belongs_to :user
- has_many :comments


## genres table
|Column|Type|Options|
|------|----|-------|
|name|string|null false|
|post_id|integer|null false, foreign_key true|

### Association
- belongs_to :post

## comments table
|Column|Type|Options|
|------|----|-------|
|comment|string|
|user_id|integer|null false, foreign_key true|
|area_id|integer|null false, foreign_key true|

### Association
- belongs_to :posts
- belongs_to :user