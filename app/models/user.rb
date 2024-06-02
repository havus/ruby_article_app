# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#   t.string "username"
#   t.string "email"
#   t.text "password_hash"
#   t.string "first_name"
#   t.string "last_name"
#   t.text "avatar_url"
#

require 'bcrypt'

class User < ApplicationRecord
  # users.password_hash in the database is a :string
  include BCrypt

  self.table_name = 'users'

  has_many :articles, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
