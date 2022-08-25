# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show]

  def index
    @list_array = ListItem.where(id: current_user.id).select(:book_id)
    @books = Book.where.not(id: @list_array)

    render json: @books
  end

  def show
    render json: @book
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
