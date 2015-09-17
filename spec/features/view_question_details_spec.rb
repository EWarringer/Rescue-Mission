require 'rails_helper'

feature 'view questions', %Q{
"As a user
I want to view a question's details
So that I can effectively understand the question"
} do
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  scenario 'visitor clicks question, visits page and sees the question title' do
    question = Question.create!(body: "What is this?", details: "This is the details of question ")

    visit '/questions'
    click_link question.body
    expect(page).to have_content(question.body)

  end

  scenario 'visitor clicks question, visits page and sees the question description' do
    question = Question.create!(body: "What is this?", details: "This is the details of question ")

    visit '/questions'
    click_link question.body
    expect(page).to have_content(question.details)

  end
end
