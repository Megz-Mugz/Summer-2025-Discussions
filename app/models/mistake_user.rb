class MistakeUser < ApplicationRecord

  belongs_to :mistake, class_name: 'Mistake'
  belongs_to :user,  class_name: 'User'

end
