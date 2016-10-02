# frozen_string_literal: true

# Allows moves to be created, viewed, and filtered
class MovesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_move, only: [:show, :edit, :update, :practiced_today, :destroy]

  # GET /moves
  def index
    move_scope = current_user.moves
    move_scope = move_scope.joins(:tags).merge(Tag.where(name: params[:tag])) if params[:tag].present?
    @moves = move_scope.page(params[:page]).per(40)
  end

  # GET /moves/1
  def show
  end

  # GET /moves/new
  def new
    @move = current_user.moves.new
  end

  # GET /moves/1/edit
  def edit
  end

  # POST /moves
  def create
    @move = current_user.moves.new(move_params)
    if @move.save
      @move.update_tags(params[:move][:tag_tokens])
      redirect_to @move, notice: 'Move was successfully created.'
    else
      render :new
    end
  end

  # PATCH /moves/1
  def update
    if @move.update(move_params)
      @move.update_tags(params[:move][:tag_tokens])
      redirect_to @move, notice: 'Move was successfully updated.'
    else
      render :edit
    end
  end

  # POST /moves/1/practiced_today
  def practiced_today
    @move.add_practice_date(current_user, Time.zone.today)
    redirect_to @move, notice: 'Great job practicing!'
  end

  # DELETE /moves/1
  def destroy
    @move.destroy
    redirect_to moves_path, notice: 'Move was successfully destroyed.'
  end

  private

  def set_move
    @move = current_user.moves.find_by_id params[:id]
    redirect_to moves_path unless @move
  end

  def move_params
    params.require(:move).permit(:name, :description, :video_url)
  end
end
