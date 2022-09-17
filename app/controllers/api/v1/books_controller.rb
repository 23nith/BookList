# frozen_string_literal: true

class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: %i[show]

  def index
    @list_array = ListItem.where(id: current_user.id).select(:book_id)
    @books = Book.where.not(id: @list_array)

    render json: @books
  end

  def show
    render json: @book
  end

  def search
    @books = Book.all.filter{|i| i.title.downcase.include? list_item_params["query"].to_s.downcase}
    render json: @books
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def list_item_params
    params.require(:book).permit(:query)
  end
end
