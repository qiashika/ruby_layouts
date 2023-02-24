class ChamberController < ApplicationController
    skip_before_action :verify_authenticity_token

  def index
    @chambers = Chamber.all

  end

  def show
    @chamber = Chamber.find(params[:id])
  
  end

  def new
    @chamber = Chamber.new
  end
  
  def create
    @chamber = Chamber.new (chamber_params)

    if @chamber.save
      redirect_to @chamber
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @chamber = Chamber.find(params[:id])
  end

  def update
    @chamber = Chamber.find(params[:id])

    if @chamber.update(chamber_params)
      redirect_to @chamber
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @chamber = Chamber.find(params[:id])
    @chamber.destroy
  
    redirect_to bill_index_path, status: :see_other
  end

  private
  def chamber_params
    params.require(:chamber).permit(:name, :address)
  end
end
