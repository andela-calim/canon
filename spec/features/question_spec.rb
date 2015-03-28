require 'rails_helper'

feature 'Question box' do
  scenario 'User asks a question' do
    visit '/questions/new'

    expect(page).to have_content("What's on your mind?")

    fill_in 'Title', with: 'Payment in dollars'
    fill_in 'Body', with: "Why can't we be paid in dollars? Aren't we world class developers?"
    click_on 'Ask Question'

    expect(page).to have_content('Question asked successfully')
    expect(page).to have_content('Payment in dollars')
    expect(page).to have_content("Why can't we be paid in dollars? Aren't we world class developers?")
    expect(page).to have_content('Comments')
  end
end