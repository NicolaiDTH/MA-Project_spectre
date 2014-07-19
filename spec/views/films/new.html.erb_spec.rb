require 'rails_helper'

RSpec.describe "films/new", :type => :view do
  before(:each) do
    assign(:film, Film.new(
      :title => "MyString",
      :synopsis => "MyString",
      :rating => 1
    ))
  end

  it "renders new film form" do
    render

    assert_select "form[action=?][method=?]", films_path, "post" do

      assert_select "input#film_title[name=?]", "film[title]"

      assert_select "input#film_synopsis[name=?]", "film[synopsis]"

      assert_select "input#film_rating[name=?]", "film[rating]"
    end
  end
end
