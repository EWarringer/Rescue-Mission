class Answer < ActiveRecord::Base
  belongs_to :question
  validates :body, length: {minimum: 10}
end
