class Public::HomesController < ApplicationController
  # トップページ、企業理念、従業員ページ遷移の確かめのコントローラー

  def top
    @bento = BentoBox.find_by(recommended: true)
  end

  def about
  end

  def confirm
  end

end
