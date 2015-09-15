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
    fill_in 'Body', with: 'how many brussels sprouts are there in the world? and this is now over 40 characters.'
    fill_in 'Details', with: 'I was just wondering. How many brussels sprouts are there in the world? jfekjlkdsanvjkbarjfbewajkbfj ew,anfjk ewasnjf ehwasj fjwealsf lnsajdlfnejwasd.fjlwebajbjk bjik bjlk bjkbjknjk.nujklbnjknljk.njk njl hnjln jk njl njln jln ojnvds nvsn jlvafd'
    click_button 'Create Question'

    visit '/questions'

    expect(page).to have_content("how many brussels sprouts are there in the world?")
  end

  scenario 'visitor submits invalid question (under 40 characters)' do
    visit '/questions/new'
    fill_in 'Body', with: 'How many sprouts?'
    fill_in 'Details', with: 'I was just wondering. How many brussels sprouts are there in the world? jfekjlkdsanvjkbarjfbewajkbfj ew,anfjk ewasnjf ehwasj fjwealsf lnsajdlfnejwasd.fjlwebajbjk bjik bjlk bjkbjknjk.nujklbnjknljk.njk njl hnjln jk njl njln jln ojnvds nvsn jlvafd'
    click_button 'Create Question'
    sleep 0.5

    expect(page).to have_content("Body is too short")
  end

  scenario 'visitor submits a filled in form' do
    visit '/questions/new'
    fill_in 'Body', with: 'how many brussels sprouts are there in the world? and this is now over 40 characters.'
    fill_in 'Details', with: 'That is my question!'
    click_button 'Create Question'
    sleep 0.5

    expect(page).to have_content("Details is too short")
  end

end
