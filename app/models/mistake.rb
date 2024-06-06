class Mistake < ApplicationRecord

  has_many :mistake_users
  has_many :users, through: :mistake_users


end
