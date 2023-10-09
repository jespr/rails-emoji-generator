require "test_helper"

class EmojisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emoji = emojis(:one)
  end

  test "should get index" do
    get emojis_url
    assert_response :success
  end

  test "should create emoji" do
    VCR.use_cassette("create_emoji") do
      assert_difference("Emoji.count") do
        post emojis_url(format: :turbo_stream), params: { emoji: { prompt: "banana"  } }
      end
    end

    assert_response :ok
  end

  test "should show emoji" do
    get emoji_url(@emoji)
    assert_response :success
  end

  test "should destroy emoji" do
    assert_difference("Emoji.count", -1) do
      delete emoji_url(@emoji)
    end

    assert_redirected_to emojis_url
  end
end
