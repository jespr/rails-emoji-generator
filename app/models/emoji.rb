class Emoji < ApplicationRecord
  has_one_attached :original
  has_one_attached :without_background

  enum status: { processing: 0, completed: 1, failed: 2 }

  after_update_commit -> { broadcast_replace_to :emoji, target: ActionView::RecordIdentifier.dom_id(self), partial: "emojis/emoji_index" }, if: -> { completed? }
  after_update_commit -> { broadcast_prepend_to :emojis, partial: "emojis/emoji_index", locals: { emoji: self } }, if: -> { completed? }

  validates :prompt, presence: true

  def hyphened_prompt
    prompt.gsub(" ", "-").downcase
  end

  def generate_emoji!
    model = Replicate.client.retrieve_model("fofr/sdxl-emoji")
    version = model.latest_version

    prediction = version.predict({ prompt: "A TOK emoji of a #{prompt}" }, "#{Rails.application.credentials.webhook_host}/webhooks/emojis")

    self.update!(prediction_id: prediction.id)
  end

  def remove_background!(url)
    model = Replicate.client.retrieve_model("stphtan94117/easy-remove-background")
    version = model.latest_version

    prediction = version.predict({ file: url }, "#{Rails.application.credentials.webhook_host}/webhooks/backgrounds")

    self.update!(prediction_id: prediction.id)
  end
end
