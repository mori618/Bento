class Public::HomesController < ApplicationController

  def top
    @bento = BentoBox.find_by(recommended: true)
  end

  def about
  end

  def confirm
  end
end
