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
    question = Question.create!(body: "Can I view the details? something Can I view the details? something Can I view the details? something Can I view the details? something", details: "Can I view the details? somethingACan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethings a user, I'd like to view the details of the question!")

    visit '/questions'
    click_link question.body
    expect(page).to have_content(question.body)

  end

  scenario 'visitor clicks question, visits page and sees the question description' do
    question = Question.create!(body: "Can I view the details? something Can I view the details? something Can I view the details? something Can I view the details? something", details: "Can I view the details? somethingACan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethingCan I view the details? somethings a user, I'd like to view the details of the question!")

    visit '/questions'
    click_link question.body
    expect(page).to have_content(question.details)

  end
end
