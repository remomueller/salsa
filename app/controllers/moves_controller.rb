# frozen_string_literal: true

# Allows moves to be created, viewed, and filtered
class MovesController < ApplicationController
  before_action :set_move, only: [:show, :edit, :update, :destroy]

  # GET /moves
  def index
    @moves = Move.all
  end

  # GET /moves/1
  def show
  end

  # GET /moves/new
  def new
    @move = Move.new
  end

  # GET /moves/1/edit
  def edit
  end

  # POST /moves
  def create
    @move = Move.new(move_params)
    if @move.save
      redirect_to @move, notice: 'Move was successfully created.'
    else
      render :new
    end
  end

  # PATCH /moves/1
  def update
    if @move.update(move_params)
      redirect_to @move, notice: 'Move was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /moves/1
  def destroy
    @move.destroy
    redirect_to moves_path, notice: 'Move was successfully destroyed.'
  end

  private

  def set_move
    @move = Move.find_by_id params[:id]
  end

  def move_params
    params.require(:move).permit(:name, :description, :video_url, :tag_tokens)
  end
end
