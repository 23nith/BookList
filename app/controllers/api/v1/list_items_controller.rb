# frozen_string_literal: true

class Api::V1::ListItemsController < ApplicationController
  before_action :set_list_item, only: %i[show update destroy]

  def reading_list
    @reading_list = ListItem.all.where(user_id: current_user.id, finish_date: nil)
    render json: @reading_list.to_json(:include => :book)
  end

  def finished_books
    @finished_books = ListItem.all.where(user_id: current_user.id).where.not(finish_date: nil)
    render json: @finished_books.to_json(:include => :book)
  end

  def show
    render json: @list_item
  end

  # def add_list_item
  def create
    @list_item = ListItem.new(list_item_params)

    if @list_item.save
      render json: @list_item, status: :created
      # render json: {
      #   status: { code: 200, message: 'Delete successful.' }
      # }
    #   render json: @list_item, status: :created, location: @list_item
    else
      render json: @list_item.errors, status: :unprocessable_entity
    end
  end

  def edit
    @list_item = ListItem.find(params[:id])
  end

  def update
    @list_item = ListItem.find(params[:id])
    if @list_item.update(list_item_params)
      render json: @list_item
    else
      render json: @list_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @list_item.destroy
    render json: {
      status: { code: 200, message: 'Delete successful.' }
    }
  end

  private

  def set_list_item
    @list_item = ListItem.find(params[:id])
  end

  def list_item_params
    params.require(:list_item).permit(:id, :book_id, :user_id, :rating, :notes, :start_date, :finish_date, :created_at, :updated_at)
  end
end
