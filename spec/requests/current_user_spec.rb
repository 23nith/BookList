require 'rails_helper'

RSpec.describe "CurrentUsers", type: :request do
  describe "GET /current_user" do
    before do
      @user = create(:user)
      sign_in @user
    end
    it "returns http success" do
      get "/current_user"
      expect(response).to have_http_status(:success)
    end

    it "Returns the json with id equal to the id of current user logged in" do
      get "/current_user"
      current_user = JSON.parse(response.body)
      expect(current_user["id"]).to match(@user.id)
    end
  end

end
