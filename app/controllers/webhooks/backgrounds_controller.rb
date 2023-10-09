module Webhooks
  class BackgroundsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      emoji = Emoji.find_by(prediction_id: params[:id])

      prediction = Replicate.client.retrieve_prediction(emoji.prediction_id)
      output = prediction.output

      emoji.without_background.attach(io: URI.open(output), filename: emoji.file_name)

      emoji.update!(status: :completed)
    end
  end
end
