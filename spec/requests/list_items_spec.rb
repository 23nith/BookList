require 'rails_helper'

RSpec.describe "ListItems", type: :request do
  describe "GET /reading_list" do
    it "returns http success" do
      get "/list_items/reading_list"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /finished_books" do
    it "returns http success" do
      get "/list_items/finished_books"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/list_items/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/list_items/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/list_items/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/list_items/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
