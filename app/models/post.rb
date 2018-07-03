class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :imgs, dependent: :destroy
  has_many :reacts, dependent: :destroy
end
