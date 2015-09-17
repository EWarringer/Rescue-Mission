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
    question = Question.create!(body: "Is this is the body of the question?", details: "Details of question ")

    visit '/questions'
    expect(page).to have_content(question.body)
  end

  scenario 'visitor sees the questions listed in order, with most recently posted first.' do
    Question.create!(body: "Is this is the body of the question?", details: "Details of question ")
    sleep 0.1
    Question.create!(body: "What is this?", details: "This is the details of question ")
    visit '/questions'
    expect(page.text.index("What is this?")).to be < page.text.index("Is this is the body of the question?")
  end
end
