require 'rails_helper'

feature 'view questions', %Q{
"As a user
I want to post a question
So that I can receive help from others"
} do
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario 'visitor clicks question, visits page and sees the question title' do
    question = Question.create!(body: "Can I view the details?", details: "As a user, I'd like to view the details of the question!")

    visit '/questions'
    click_link question.body
    expect(page).to have_content(question.body)

  end
end
