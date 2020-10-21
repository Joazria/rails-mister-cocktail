class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

 def index
  @cocktails = Cocktail.all
 end

   # GET /articles/1
  def show
  @dose = Dose.new
  end

  # GET /articles/new
  def new
    @cocktail = Cocktail.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail, notice: 'A new cocktail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @cocktail.update(cocktail_params)
      redirect_to @cocktail, notice: 'The cocktail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @cocktail.destroy
    redirect_to root_path, notice: 'The cocktail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cocktail_params
      params.require(:cocktail).permit(:name)
    end
end
