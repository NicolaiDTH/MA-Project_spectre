require 'rails_helper'
require 'imdb'

describe 'film beginner' do
 context 'registering' do
  before do
   user = User.create email: 's@s.com', password: '123456789', password_confirmation: '123456789'
   login_as user
  end

  it 'searches for a film and adds it to the shelf' do
   visit '/films'
   fill_in 'search_search', with: 'Vanilla Sky'
   expect(page).to have_css("img[src*='http://ia.media-imdb.com/images/']")
  end

  it 'goes away when a film has been added' do
   visit '/films'
   fill_in 'search_search', with: 'Finding Nemo'
   expect(page).not_to have_css('input')
  end
 end
end