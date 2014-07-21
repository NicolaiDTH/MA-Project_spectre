require 'rails_helper'
require 'imdb'

# describe 'spectre first page' do
#  context 'has no films yet' do
#   it 'asks a user to enter a film' do
#    visit '/films'
#    expect(page).to have_content 'enter a film'
#   end
#  end
# end

# describe 'spectre home page' do
#  context 'has films' do
#   it 'shows the added film' do
#    visit '/films'
#    expect(page).to have_content
#   end
#  end
# end

describe 'spectre main page' do
 context 'searching for films' do
  it 'searches for a film' do
   visit '/films'
   fill_in 'search_search', with: 'Vanilla Sky'
   click_button 'search'
   expect(page).to have_content 'Vanilla Sky'
  end
 end
end