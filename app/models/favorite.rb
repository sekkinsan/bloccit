class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #have to make favorites visible for users to see
  scope :visible_to, -> (user) { user ? all : joins(:topic).where('topics.public' => true) }
end
