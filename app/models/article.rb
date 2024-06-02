# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#   t.bigint "author_id"
#   t.string "title"
#   t.text "content"
#   t.datetime "published_at"
#

class Article < ApplicationRecord
  self.table_name = 'articles'

  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :comments, foreign_key: :article_id, class_name: 'Comment'

  validates :title, presence: true
  validates :content, presence: true
  validates :published_at, presence: true

  def published_at_formatted
    published_at.strftime('%B %d, %Y')
  end
end
