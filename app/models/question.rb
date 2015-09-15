class Question < ActiveRecord::Base
  validates :body, length: {minimum: 40}
  validates :details, length: {minimum: 150}
end
