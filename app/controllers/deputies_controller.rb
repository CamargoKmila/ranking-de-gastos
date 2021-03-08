class DeputiesController < ApplicationController
  def index
    @deputies = Deputy.all
  end

  def show
    @deputy = Deputy.find(params[:id])
    @costs = @deputy.costs
    @totalCost = Cost.totalCost
    @maxCost = Cost.maxCost
  end
end