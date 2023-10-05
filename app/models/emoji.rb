class Emoji < ApplicationRecord
  has_one_attached :original
  has_one_attached :without_background

  enum status: { processing: 0, completed: 1, failed: 2 }

  after_update_commit -> { broadcast_replace_to :emoji, target: ActionView::RecordIdentifier.dom_id(self), partial: "emojis/emoji" }

  def generate_emoji!
    model = Replicate.client.retrieve_model("fofr/sdxl-emoji")
    version = model.latest_version

    prediction = version.predict(prompt: "A TOK emoji of a #{prompt}")

    self.update!(prediction_id: prediction.id)
  end

  def attach_output_image!(output_url)
    require 'open-uri'
    original.attach(io: URI.open(output_url), filename: "emoji.png")
  end
end
