require 'rails_helper'

feature 'view questions', %Q{
'As a user
I want to view recently posted questions
So that I can help others'
} do

# Acceptance Criteria
# - I must see the title of each question
# - I must see questions listed in order, most recently posted first
  scenario 'visitor views questions' do
    question = Question.create!(body: "something?")

    visit '/questions'
    expect(page).to have_content(question.body)

  end
end
