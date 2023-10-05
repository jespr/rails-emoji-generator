class EmojisController < ApplicationController
  before_action :set_emoji, only: %i[ show destroy ]

  def index
    @emojis = Emoji.all
  end

  def show
  end

  def new
    @emoji = Emoji.new
  end

  def create
    @emoji = Emoji.new(emoji_params)
    @emoji.generate_emoji!

    respond_to do |format|
      if @emoji.save
        format.html { redirect_to emoji_url(@emoji), notice: "Emoji was successfully created and is now processing..." }
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
