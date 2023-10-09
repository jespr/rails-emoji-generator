module Webhooks
  class BackgroundsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      require "open-uri"
      emoji = Emoji.find_by(prediction_id: params[:id])

      emoji.without_background.attach(io: URI.open(params[:output]), filename: emoji.file_name)

      emoji.update!(status: :completed)
    end
  end
end
