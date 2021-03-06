class CocktailsController < ApplicationController
  before_action :find_cocktail, only: %i[edit show]

  def index
    @cocktails = Cocktail.all
    @search = params['search']
    if @search.present?
      @name = @search['cocktail_name']
      @cocktails = Cocktail.where('name ILIKE ?', "%#{@name}%")
    end
  end

  def show
  end

  def edit
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end