class User < ApplicationRecord

  has_many :mistake_users
  has_many :mistakes, through: :mistake_users

end
