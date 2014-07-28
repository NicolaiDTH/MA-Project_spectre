require 'rails_helper'
require 'imdb'

describe 'spectre newbie' do

  context 'on registering user' do

    before do
     Sam = User.create email: 's@s.com', password: '123456789', password_confirmation: '123456789'
     login_as Sam
    end

    it 'can view its username and email in persona' do
    visit '/users/edit'
    find_field('user_email').value.should eq 's@s.com'
    end

    # it 'username and email are added to the [user] database' do
    # user = User.find_by(:email=>'s@s.com')
    # expect(user.id).to eq 1
    # end

    it 'asks for your favourite film' do
    visit '/'
    expect(page).to have_content ("What's your favourite film?")
    end

    context 'favourite film entered' do

    before do
     visit '/'
     fill_in 'search_search', with: 'Midnight Cowboy'
     click_button '+'
    end

    it 'displays the poster for your favourite film on your shelf only' do
     expect(page).to have_css("img[src*='http://ia.media-imdb.com/images/M/MV5BMTMzMjY1OTE5OV5BMl5BanBnXkFtZTcwMjUzNTk3NA@@.jpg']", count: 1)
    end

    # it 'can see its first recommendation' do
    #  expect(page).to have_css("", count: 1)
    # end

   end

#   end

#   context 'on categorising first recommendation' do

#    context 'if [shelf] button is clicked' do

#     it 'first recommendation is added to the shelf' do
#      visit '/'
#      fill_in 'search_search', with: 'Midnight Cowboy'
#      click_button('+')
#      click_button('shelf')
#      expect(page).to have_css("", count: 1)
#     end
   
#     it 'first recommendation status in the film database is given the [shelf] attribute' do
#      visit '/'
#      fill_in 'search_search', with: 'Midnight Cowboy'
#      click_button('+')
#      click_button('shelf')
#      expect(page).to have_css("", count: 1)
#     end

#    end

#    context 'if [list] button is clicked' do

#     it 'first recommendation is added to the list' do
#      visit '/'
#      fill_in 'search_search', with: 'Midnight Cowboy'
#      click_button('+')
#      click_button('list')
#      expect(page).to have_css("", count: 1)
#     end
   
#     it 'first recommendation is added to the film database with the [list] attribute' do
#      visit '/'
#      fill_in 'search_search', with: 'Midnight Cowboy'
#      click_button('+')
#      click_button('list')
#      expect(page).to have_css("", count: 1)
#     end

#    end

#    context 'if [reject] button is clicked' do

#     it 'first recommendation is added to the reject list' do
#      visit '/'
#      fill_in 'search_search', with: 'Midnight Cowboy'
#      click_button('+')
#      click_button('reject')
#      expect(page).to have_css("", count: 1)
#     end
   
#     it 'first recommendation is added to the film database with the [reject] attribute' do
#      visit '/'
#      fill_in 'search_search', with: 'Midnight Cowboy'
#      click_button('+')
#      click_button('reject')
#      expect(page).to have_css("", count: 1)
#     end

#    end

#   end

#   context 'on completing classification of the first recommendation' do

#    it 'can see the second recommendation' do
#     visit '/'
#     fill_in 'search_search', with: 'Midnight Cowboy'
#     click_button('+')
#     expect(page).to have_css("", count: 1)
#    end

#    it 'is asked to categorise the second recommendation' do
#     visit '/'
#     fill_in 'search_search', with: 'Midnight Cowboy'
#     click_button('+')
#     expect(page).to have_css("", count: 1)
#    end

  end

end