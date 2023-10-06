class EmojisController < ApplicationController
  before_action :set_emoji, only: %i[ destroy ]

  def index
    @completed_emojis = Emoji.where(status: :completed).order(created_at: :desc).all
    @emoji = Emoji.new
  end

  def show
    @emoji = Emoji.find(params[:id])
  end

  def create
    @emoji = Emoji.new(emoji_params)
    @emoji.generate_emoji!

    respond_to do |format|
      if @emoji.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @emoji.destroy!

    respond_to do |format|
      format.html { redirect_to emojis_url, notice: "Emoji was successfully destroyed." }
    end
  end

  private
    def set_emoji
      @emoji = Emoji.find(params[:id])
    end

    def emoji_params
      params.require(:emoji).permit(:prompt)
    end
end
