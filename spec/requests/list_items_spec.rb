# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ListItems', type: :request do
  # Get all reading list
  describe 'GET /reading_list' do
    before do
      @user = create(:user)
      sign_in @user
    end

    it 'Returns response 200' do
      get '/reading_list'
      expect(response).to have_http_status(:success)
    end

    it 'Returns json with items equal to count of all books in the reading list of the current user' do
      get '/reading_list'

      expect(response).to have_http_status(:success)
      reading_list = JSON.parse(response.body)
      expect(reading_list.count).to eq(ListItem.all.where(user_id: @user.id, finish_date: nil).count)
    end
  end

  # Get all finished_books
  describe 'GET /finished_books' do
    before do
      @user = create(:user)
      sign_in @user
    end

    it 'Returns response 200' do
      get '/finished_books'
      expect(response).to have_http_status(:success)
    end

    it 'Returns json with items equal to count of all books finished by the current user' do
      get '/finished_books'

      expect(response).to have_http_status(:success)
      finished_books = JSON.parse(response.body)
      expect(finished_books.count).to eq(ListItem.all.where(user_id: @user.id, finish_date: nil).count)
    end
  end

  # Show user
  describe 'POST /list_item' do
    before do
      @user = create(:user)
      sign_in @user
      @book = create(:book)
    end

    let!(:list_item1) do
      ListItem.create!(
        book_id: @book.id,
        user_id: @user.id,
        rating: 2,
        notes: 'sample notes',
        start_date: 'Fri Jun 10 2022 11:53:50 GMT+0000',
        finish_date: 'Sat Jun 11 2022 11:53:50 GMT+0000',
        created_at: 'Fri Jun 10 2022 11:53:50 GMT+0000',
        updated_at: 'Sat Jun 11 2022 11:53:50 GMT+0000'
      )
    end

    it 'Returns response 200' do
      post '/list_item', params: { id: list_item1.id }
      expect(response).to have_http_status(:success)
    end

    it 'Returns the json with id equal to parameter id passed' do
      post '/list_item', params: { id: list_item1.id }
      list_item = JSON.parse(response.body)
      expect(list_item['id']).to match(list_item1.id)
    end
  end

  # Add user
  describe 'POST /add_list_item' do
    before do
      @user = create(:user)
      sign_in @user
      @book = create(:book)
    end

    it 'Returns response successful' do
      post '/add_list_item', params: { list_item: {
        book_id: @book.id,
        user_id: @user.id,
        rating: 2,
        notes: 'sample notes',
        start_date: 'Fri Jun 10 2022 11:53:50 GMT+0000',
        finish_date: 'Sat Jun 11 2022 11:53:50 GMT+0000',
        created_at: 'Fri Jun 10 2022 11:53:50 GMT+0000',
        updated_at: 'Sat Jun 11 2022 11:53:50 GMT+0000'
      } }

      expect(response).to have_http_status(:success)
    end

    it 'Will increase the count of ListItems' do
      expect do
        post '/add_list_item', params: { list_item: {
          book_id: @book.id,
          user_id: @user.id,
          rating: 2,
          notes: 'sample notes',
          start_date: 'Fri Jun 10 2022 11:53:50 GMT+0000',
          finish_date: 'Sat Jun 11 2022 11:53:50 GMT+0000',
          created_at: 'Fri Jun 10 2022 11:53:50 GMT+0000',
          updated_at: 'Sat Jun 11 2022 11:53:50 GMT+0000'
        } }
      end.to \
        change(ListItem, :count)
        .by(1)
    end
  end

  # Edit user
  describe 'POST /edit_list_item' do
    before do
      @user = create(:user)
      sign_in @user
      @book = create(:book)
    end

    let!(:list_item1) do
      ListItem.create!(
        book_id: @book.id,
        user_id: @user.id,
        rating: 2,
        notes: 'sample notes',
        start_date: 'Fri Jun 10 2022 11:53:50 GMT+0000',
        finish_date: 'Sat Jun 11 2022 11:53:50 GMT+0000',
        created_at: 'Fri Jun 10 2022 11:53:50 GMT+0000',
        updated_at: 'Sat Jun 11 2022 11:53:50 GMT+0000'
      )
    end

    it 'Returns response successful' do
      post '/edit_list_item', params: { id: list_item1.id, list_item: {
        book_id: @book.id,
        user_id: @user.id,
        rating: 2,
        notes: 'sample notes edited',
        start_date: 'Fri Jun 10 2022 11:53:50 GMT+0000',
        finish_date: 'Sat Jun 11 2022 11:53:50 GMT+0000',
        created_at: 'Fri Jun 10 2022 11:53:50 GMT+0000',
        updated_at: 'Sat Jun 11 2022 11:53:50 GMT+0000'
      } }

      expect(response).to have_http_status(:success)
    end

    it 'Returns json with field equal to updated value' do
      post '/edit_list_item', params: { id: list_item1.id, list_item: {
        book_id: @book.id,
        user_id: @user.id,
        rating: 2,
        notes: 'sample notes edited',
        start_date: 'Fri Jun 10 2022 11:53:50 GMT+0000',
        finish_date: 'Sat Jun 11 2022 11:53:50 GMT+0000',
        created_at: 'Fri Jun 10 2022 11:53:50 GMT+0000',
        updated_at: 'Sat Jun 11 2022 11:53:50 GMT+0000'
      } }

      the_user = JSON.parse(response.body)
      expect(the_user['notes']).to eq 'sample notes edited'
    end
  end

  # Delete user
  describe 'DELETE /list_item' do
    before do
      @user = create(:user)
      sign_in @user
      @book = create(:book)
    end

    let!(:list_item1) do
      ListItem.create!(
        book_id: @book.id,
        user_id: @user.id,
        rating: 2,
        notes: 'sample notes',
        start_date: 'Fri Jun 10 2022 11:53:50 GMT+0000',
        finish_date: 'Sat Jun 11 2022 11:53:50 GMT+0000',
        created_at: 'Fri Jun 10 2022 11:53:50 GMT+0000',
        updated_at: 'Sat Jun 11 2022 11:53:50 GMT+0000'
      )
    end

    it 'Returns response successful' do
      delete '/list_item', params: { id: list_item1.id }
      expect(response).to have_http_status(:success)
    end

    let!(:list_item1) do
      ListItem.create!(
        book_id: @book.id,
        user_id: @user.id,
        rating: 2,
        notes: 'sample notes',
        start_date: 'Fri Jun 10 2022 11:53:50 GMT+0000',
        finish_date: 'Sat Jun 11 2022 11:53:50 GMT+0000',
        created_at: 'Fri Jun 10 2022 11:53:50 GMT+0000',
        updated_at: 'Sat Jun 11 2022 11:53:50 GMT+0000'
      )
    end

    it 'Decreases the count of list items' do
      expect { delete '/list_item', params: { id: list_item1.id } }.to \
        change(ListItem, :count)
        .by(-1)
    end
  end
end
