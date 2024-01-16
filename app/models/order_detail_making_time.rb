class OrderDetailMakingTime < ApplicationRecord
  belongs_to :order_detail

  def elapsed_time_hour
    elapsed_seconds = end_at - start_at
    elapsed_seconds > 0 ? (elapsed_seconds.div(60*60)) : 0
  end

  def elapsed_time_minute
    elapsed_seconds = end_at - start_at
    elapsed_seconds > 0 ? (elapsed_seconds.div(60)).modulo(60) : 0
  end

  def elapsed_time
    "#{elapsed_time_hour}時間#{elapsed_time_minute}分"
  end
end

