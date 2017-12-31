# frozen_string_literal: true

# Displays publicly available pages.
class ExternalController < ApplicationController
  # # GET /landing
  # def landing
  # end

  # GET /version
  # GET /version.json
  def version
    render layout: "layouts/full_page"
  end
end
