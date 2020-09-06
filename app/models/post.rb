class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  validates :title, presence: true
  validates :genre_id, presence: true

  belongs_to :user
end
