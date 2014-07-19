require 'rails_helper'

RSpec.describe "Films", :type => :request do
  describe "GET /films" do
    it "works! (now write some real specs)" do
      get films_path
      expect(response.status).to be(200)
    end
  end
end
