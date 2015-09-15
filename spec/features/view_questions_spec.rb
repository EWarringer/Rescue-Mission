require 'rails_helper'

feature 'view questions', %Q{
'As a user
I want to view recently posted questions
So that I can help others'
} do

# Acceptance Criteria
# - I must see the title of each question
# - I must see questions listed in order, most recently posted first
  scenario 'visitor sees the title of each question' do
    question = Question.create!(body: "something?")

    visit '/questions'
    expect(page).to have_content(question.body)
  end

  scenario 'visitor sees the questions listed in order, with most recently posted first.' do
    Question.create!(body: "Question 1", details: "Details of question 1")
    sleep 1
    Question.create!(body: "Question number two", details: "Details of question 2")
    sleep 1
    Question.create!(body: "something else here", details: "Details of question 3")
    visit '/questions'
    expect(page.text.index("something else here")).to be < page.text.index("Question 1")
  end
end
