require "test_helper"

class EmojiTest < ActiveSupport::TestCase
  test "prompt is required" do
    emoji = Emoji.new

    refute emoji.valid?
    assert emoji.errors[:prompt].include?("can't be blank")
  end

  test "prompt must be letters, hyphens, underscores and spaces" do
    emoji = Emoji.new(prompt: "steve jobs")
    assert emoji.valid?

    emoji = Emoji.new(prompt: "steve-jobs")
    assert emoji.valid?

    emoji = Emoji.new(prompt: "steve/jobs")
    refute emoji.valid?
  end

  test "prompt is normalized" do
    emoji = Emoji.new(prompt: "Steve Jobs")
    assert_equal "steve jobs", emoji.prompt
  end

  test "#hyphened_prompt" do
    emoji = Emoji.new(prompt: "steve jobs")
    assert_equal "steve-jobs", emoji.hyphened_prompt
  end

  test "#file_name" do
    emoji = Emoji.new(prompt: "steve jobs")
    assert_equal "steve-jobs.png", emoji.file_name
  end
end
