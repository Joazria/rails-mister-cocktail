class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def show
    @cocktails = Cocktail.all
  end

  def new
    @cocktails = Cocktail.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def edit
    @cocktails = Cocktail.all
  end

  def create
    @cocktails = Cocktail.all
    @dose = Dose.new(dose_params)
        @cocktail = Cocktail.find(params[:cocktail_id])

    @dose.cocktail = @cocktail
    if @dose.save
      flash[:alert] = "A new dose was created."
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    @cocktails = Cocktail.all
    if @dose.update(dose_params)
      redirect_to @dose, notice: 'The dose was successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @cocktails = Cocktail.all
    @dose.delete
    redirect_to cocktails_url, notice: 'The dose was successfully destroyed.'
  end

  private
    def set_dose
      @dose = Dose.find(params[:id])
    end

    def dose_params
      params.require(:dose).permit(:name, :description, :ingredient_id)
    end
end

