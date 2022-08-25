# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  describe 'GET /books' do
    before do
      @user = create(:user)
      sign_in @user
    end

    it 'returns http success' do
      get '/books'
      expect(response).to have_http_status(:success)
    end

    it 'Returns json with items equal to count of all existing Books' do
      get '/books'

      expect(response).to have_http_status(:success)
      books = JSON.parse(response.body)
      expect(books.count).to eq(Book.all.count)
    end
  end

  # Show book
  describe 'POST /book' do
    before do
      @user = create(:user)
      sign_in @user
    end

    let!(:book1) do
      Book.create!(
        title: 'Voice of War',
        author: 'Zack Argyle',
        cover_image_url: 'https://images-na.ssl-images-amazon.com/images/I/41JodZ5Vl%2BL.jpg',
        page_count: '',
        publisher: 'Self Published',
        synopsis: 'Blah blah blah',
        created_at: '',
        updated_at: ''
      )
    end

    it 'Returns response 200' do
      post '/book', params: { id: book1.id }
      expect(response).to have_http_status(:success)
    end

    it 'Returns the json with id equal to parameter id passed' do
      post '/book', params: { id: book1.id }
      book = JSON.parse(response.body)
      expect(book['id']).to match(book1.id)
    end
  end
end
