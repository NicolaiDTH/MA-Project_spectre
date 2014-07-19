require 'rails_helper'

RSpec.describe "films/edit", :type => :view do
  before(:each) do
    @film = assign(:film, Film.create!(
      :title => "MyString",
      :synopsis => "MyString",
      :rating => 1
    ))
  end

  it "renders the edit film form" do
    render

    assert_select "form[action=?][method=?]", film_path(@film), "post" do

      assert_select "input#film_title[name=?]", "film[title]"

      assert_select "input#film_synopsis[name=?]", "film[synopsis]"

      assert_select "input#film_rating[name=?]", "film[rating]"
    end
  end
end
