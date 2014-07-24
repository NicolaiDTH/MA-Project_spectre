require 'rails_helper'
require 'imdb'

describe 'spectre beginning page' do
 context 'shelf start' do
  it 'searches for a film and adds it to the shelf' do
   visit '/films'
   fill_in 'search_search', with: 'Vanilla Sky'
   click_button '+'
   expect(page).to have_css("img[src*='http://ia.media-imdb.com/images/']")
  end

  it 'goes away when a film has been added' do
   visit '/films'
   fill_in 'search_search', with: 'Finding Nemo'
   click_button '+'
   expect(page).not_to have_content 'add a film'
  end
 end
end

describe 'recommender' do
 context 'has a film on the shelf' do
  it 'gives a recommendation' do
   visit '/films'
   fill_in 'search_search', with: 'Finding Nemo'
   click_button '+'
   expect(page).to have_content(@recommendation)
  end
 end
end

describe 'adding a film' do
 context 'registering' do
  before do
   user = User.create email: 's@s.com', password: '123456789', password_confirmation: '123456789'
   login_as user
  end
