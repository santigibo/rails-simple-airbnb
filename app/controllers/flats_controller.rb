class FlatsController < ApplicationController
  def index(list, msg)
    @flats = list
    @msg = msg
  end

  def new
    @flat = Flat.new
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def create
    Flat.create(params_secure)

    redirect_to flat_path(params[:id])
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    Flat.find(params[:id]).update(params_secure)

    redirect_to flat_path(params[:id])
  end

  def destroy
    f = Flat.find(params[:id])
    f.destroy

    redirect_to flats_path
  end

  def search
    if params[:search].nil?
      index(Flat.all, "")

    else
      index(Flat.where('name LIKE ?', "#{params[:search]}"), "You searched for #{params[:search]}. We found #{Flat.where('name LIKE ?', "#{params[:search]}").length} flats out of our #{Flat.all.length} on our website.")
    end
  end

  private

  def params_secure
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guest)
  end
end
