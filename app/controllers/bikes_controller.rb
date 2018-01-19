class BikesController < ApplicationController
  before_action :find_bike, only:[:edit, :update, :destroy]

  def index
    @bikes = Bike.select('bikes.id, bikeType, quantity, supName').joins(:supplier)
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(clean_params)
    if @bike.save
      redirect_to bikes_path, notice: "新增成功"
    else
      render "new" #new.html.erb
    end
  end

  def edit
  end

  def update
    if @bike.update(clean_params)
      redirect_to bikes_path, notice: "修改成功"
    else
      render "edit"
    end
  end

  def destroy
    @bike.destroy
    redirect_to bikes_path, notice: "刪除完成"
  end

  private
  def clean_params
    params.require(:bike).permit(:bikeNo, :bikeType, :quantity, :supplier_id )
  end

  def find_bike
    @bike = Bike.find_by(id: params[:id])
  end

end
