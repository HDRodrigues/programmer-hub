class Post < ApplicationRecord
  belongs_to :user
  #destroi o like quando um post é excluído
  has_many :likes, dependent: :destroy
  acts_as_commentable
  
  validates :user, :body, presence: true
end