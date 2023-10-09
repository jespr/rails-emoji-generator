require "test_helper"

module Webhooks
  class BackgroundsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @emoji = emojis(:processing)
    end

    test "POST to #create stores emoji with no background and marks it as completed" do
      VCR.use_cassette("create_webhooks_emoji_background") do
        refute @emoji.reload.without_background.attached?

        post webhooks_backgrounds_url, params: { id: "bsvnvvlbli52immbsvrkmq6g4i", output: "https://replicate.delivery/pbxt/8lAMWP9lE0ZhCFsPIDUIQJh4pML4MpUPxkdWAd1Y8ZtwxHbE/out-0.png" }

        assert @emoji.reload.without_background.attached?
        assert @emoji.completed?
      end

      assert_response :ok
    end
  end
end
