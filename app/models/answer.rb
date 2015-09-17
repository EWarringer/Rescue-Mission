class Answer < ActiveRecord::Base
  belongs_to :questions
  validates :body, length: {minimum: 10}
end
