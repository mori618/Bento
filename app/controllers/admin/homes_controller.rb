class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
#管理者topページ
  def top
  end
end
