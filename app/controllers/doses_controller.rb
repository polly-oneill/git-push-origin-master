class DosesController < ApplicationController
  before_action :find_dose, only: [ :show, :destroy ]

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else 
      render :new
    end 
  end 

  def destroy
    @dose.destroy
  end
  
  private

  def find_dose 
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end 
end
