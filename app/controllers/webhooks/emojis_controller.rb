module Webhooks
  class EmojisController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      emoji = Emoji.find_by(prediction_id: params[:id])

      prediction = Replicate.client.retrieve_prediction(emoji.prediction_id)
      output = prediction.output

      emoji.original.attach(io: URI.open(output.first), filename: "emoji.png")

      emoji.remove_background!(output.first)
    end
  end
end
