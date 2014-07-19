require 'rails_helper'

RSpec.describe "films/show", :type => :view do
  before(:each) do
    @film = assign(:film, Film.create!(
      :title => "Title",
      :synopsis => "Synopsis",
      :rating => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Synopsis/)
    expect(rendered).to match(/1/)
  end
end
