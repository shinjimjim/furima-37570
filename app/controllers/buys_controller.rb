class BuysController < ApplicationController
  def index
    @buy_address = BuyAddress.new
  end

end
