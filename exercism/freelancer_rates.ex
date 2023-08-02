defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount - (before_discount * discount/100)
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_rate = 22 * daily_rate(hourly_rate)
    round(Float.ceil(apply_discount(monthly_rate, discount)))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    new_rate = apply_discount(hourly_rate, discount)
    days = budget / (8 * new_rate)
    Float.floor(days,1)
  end
end

