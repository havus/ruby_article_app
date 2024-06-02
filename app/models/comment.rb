# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#   t.bigint "author_id"
#   t.bigint "article_id"
#   t.text "content"
#

class Comment < ApplicationRecord
  self.table_name = 'comments'

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :article, foreign_key: :article_id
end
