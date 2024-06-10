class User < ApplicationRecord

  include ActionView::Helpers::UrlHelper

  has_many :mistake_users
  has_many :mistakes, through: :mistake_users



  # VALIDATIONS FOR UNIQUENESS OF EMAILS
  validates_uniqueness_of :email, :presence => true
  validates :name, :presence => true
end
