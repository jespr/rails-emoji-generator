class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    emoji = Emoji.find_by(prediction_id: params[:id])

    prediction = Replicate.client.retrieve_prediction(emoji.prediction_id)
    output = prediction.output

    emoji.attach_output_image!(output.first)
  end
end
