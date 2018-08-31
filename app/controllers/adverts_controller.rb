class AdvertsController < ApplicationController
  before_action :find_advert, only: [:show, :edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @adverts = Advert.all.order("created_at DESC")
  end

  def show
  end

  def new
    @advert = current_user.adverts.build
  end

  def create
    @advert = current_user.adverts.build(advert_params)
    if @advert.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @advert.update(advert_params)
      redirect_to advert_path
    else
      render 'edit'
    end
  end

  def destroy
    @advert.destroy
    redirect_to root_path
  end

private

  def advert_params
    params.require(:advert).permit(:title,:description)
  end

  def find_advert
    @advert = Advert.find(params[:id])
  end

end
