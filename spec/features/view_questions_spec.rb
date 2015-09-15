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
    question = Question.create!(body: "Question dfsdfsfdsfdsfdsfsdfwfw4efsddssdfdsfsdfsfsfsfsfsf1Question 1Question 1Question 1Question 1Question 1Question 1Question 1Question 1", details: "Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1")

    visit '/questions'
    expect(page).to have_content(question.body)
  end

  scenario 'visitor sees the questions listed in order, with most recently posted first.' do
    Question.create!(body: "Question 1Question 1Question 1Question 1Question 1Question 1Question 1Question 1Question 1", details: "Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1Details of question 1")
    sleep 0.1
    Question.create!(body: "something else heresomething else heresomething else heresomething else heresomething else here", details: "something else heresomething else heresomething else heresomething else heresomething else heresomething else heresomething else heresomething else heresomething else heresomething else heresomething else heresomething else heresomething else heresomething else heresomething else heresomething else heresomething else hereDetails of question 3")
    visit '/questions'
    expect(page.text.index("something else heresomething else heresomething else heresomething else heresomething else here")).to be < page.text.index("Question 1Question 1Question 1Question 1Question 1Question 1Question 1Question 1Question 1")
  end
end
