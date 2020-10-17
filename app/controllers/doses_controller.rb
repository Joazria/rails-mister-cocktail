class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def edit
  end

  def create
    @dose = Dose.new(dose_params)
        @cocktail = Cocktail.find(params[:cocktail_id])

    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'A new dose was successfully created.'
    else
      render :new
    end
  end

  def update
    if @dose.update(dose_params)
      redirect_to @dose, notice: 'The dose was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
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

