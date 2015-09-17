require 'rails_helper'

feature 'view questions', %Q{
"As a user
I want to post a question
So that I can receive help from others"
} do
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario 'visitor submits a valid question(40+ chars) and description(150+ chars)' do
    visit '/questions/new'
    fill_in 'Body', with: 'how many brussels sprouts are there in the world?'
    fill_in 'Details', with: 'Five hundred fifty two trillion'
    click_button 'Create Question'

    visit '/questions'

    expect(page).to have_content("how many brussels sprouts are there in the world?")
  end

  scenario 'visitor submits invalid question (under 40 characters)' do
    visit '/questions/new'
    fill_in 'Body', with: 'what?'
    fill_in 'Details', with: 'Five hundred fifty two trillion'
    click_button 'Create Question'
    sleep 0.5

    expect(page).to have_content("Body is too short")
  end

  scenario 'visitor submits invalid details' do
    visit '/questions/new'
    fill_in 'Body', with: 'how many brussels sprouts are there in the world?'
    fill_in 'Details', with: '552T'
    click_button 'Create Question'
    sleep 0.5

    expect(page).to have_content("Details is too short")
  end

end
