# frozen_string_literal: true

# Allows existing tags to be updated
class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  def index
    @tags = current_user.tags
  end

  # GET /tags/1
  def show
  end

  # GET /tags/new
  def new
    @tag = current_user.tags.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  def create
    @tag = current_user.tags.new(tag_params)

    if @tag.save
      redirect_to @tag, notice: 'Tag was successfully created.'
    else
      render :new
    end
  end

  # PATCH /tags/1
  def update
    if @tag.update(tag_params)
      redirect_to @tag, notice: 'Tag was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
    redirect_to tags_path, notice: 'Tag was successfully destroyed.'
  end

  private

  def set_tag
    @tag = current_user.tags.find_by_id params[:id]
    redirect_to tags_path unless @tag
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
