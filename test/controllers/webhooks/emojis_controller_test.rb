require "test_helper"

module Webhooks
  class EmojisControllerTest < ActionDispatch::IntegrationTest
    setup do
      @emoji = emojis(:processing)
    end

    test "POST to #create stores emoji" do
      VCR.use_cassette("create_webhooks_emoji") do
        refute @emoji.reload.original.attached?

        Emoji.any_instance.expects(:remove_background!).with("https://replicate.delivery/pbxt/8lAMWP9lE0ZhCFsPIDUIQJh4pML4MpUPxkdWAd1Y8ZtwxHbE/out-0.png")
        post webhooks_emojis_url, params: { id: "bsvnvvlbli52immbsvrkmq6g4i" }

        assert @emoji.reload.original.attached?
      end

      assert_response :ok
    end
  end
end
