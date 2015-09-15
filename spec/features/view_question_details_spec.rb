require 'rails_helper'

feature 'view questions', %Q{
'As a user
I want to view a question's details
So that I can effectively understand the question
} do
  # As a user
  # I want to view a question's details
  # So that I can effectively understand the question

  scenario 'visitor views question details' do
    question = Question.create!(body: "Can I view the details?", details: "As a user, I'd like to view the details of the question!")

    visit '/questions'
    click_link question.body
    expect(page).to have_content(question.details)

  end
end
