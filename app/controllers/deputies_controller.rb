class DeputiesController < ApplicationController
  def index;
    @deputies = Deputy.all
  end

  def show;
  end
end