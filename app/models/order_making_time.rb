class OrderMakingTime < ApplicationRecord
  belongs_to :order
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

  def shipping_elapsed_time_hour
    shipping_elapsed_seconds = shipping_end_at - shipping_start_at
    shipping_elapsed_seconds > 0 ? (shipping_elapsed_seconds.div(60*60)) : 0
  end

  def shipping_elapsed_time_minute
    shipping_elapsed_seconds = shipping_end_at - shipping_start_at
    shipping_elapsed_seconds > 0 ? (shipping_elapsed_seconds.div(60)).modulo(60) : 0
  end

  def shipping_elapsed_time
    "#{shipping_elapsed_time_hour}時間#{shipping_elapsed_time_minute}分"
  end

end
