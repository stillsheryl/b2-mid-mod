class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:mechanic_id])
    if !params[:search].nil?
      @mechanic.add_ride(params[:search])
      redirect_to "/mechanics/#{params[:mechanic_id]}"
    end
  end

end
