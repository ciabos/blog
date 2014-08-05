class Comment < ActiveRecord::Base
  belongs_to :post
  validates :name, :email, :content, presence: true 
  validates :email, format: /\A[^@]+@[^@]+\z/
  validates :content, length: { minimum: 10 }
end
