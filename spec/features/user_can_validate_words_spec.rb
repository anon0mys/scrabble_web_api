require 'rails_helper'

feature 'A guest user can submit a word' do
  context 'on the home path' do
    scenario 'and it validates that it is a word' do
      visit '/'

      fill_in 'word_search', with: 'foxes'
      click_on 'Validate Word'

      expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
    end

    scenario 'and it does not validate if it is not a word' do
      visit '/'

      fill_in 'word_search', with: 'foxez'
      click_on 'Validate Word'

      expect(page).to have_content("'foxez' is not a valid word.")
    end
  end
end
