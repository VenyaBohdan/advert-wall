class Comment < ApplicationRecord
  belongs_to :advert
  belongs_to :user
end
