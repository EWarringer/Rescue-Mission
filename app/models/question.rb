class Question < ActiveRecord::Base
  has_many :answers
  validates :body, length: {minimum: 10}
  validates :details, length: {minimum: 10}
end
