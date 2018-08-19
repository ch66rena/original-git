class Comment < ApplicationRecord
#  belongs_to :user_id
#  belongs_to :photo_id

  belongs_to :user
  belongs_to :photo
end
