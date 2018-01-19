class RentsController < ApplicationController
    before_action :find_rent, only:[:edit, :update, :destroy, :back]

  def index
    @rents = Rent.select('rents.id, customers.cusName, bikes.bikeType, rents.created_at, backtime, price').joins(:customer, :bike)
  end

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(clean_params)
    if @rent.save
     redirect_to rents_path, notice: "新增成功"
    else
     render "new" #new.html.erb
    end
  end

  def edit
  end

  def back
    # Time.zone = "Taipei"
    rtime = @rent.created_at
    btime = Time.now
    ttime = (((btime.to_time)-(rtime.to_time)).to_i)/60
    if ttime % 60 == 0
      cost = (ttime/60)*100
    elsif ttime <= 30
      cost = 50
    elsif ttime > 30 && ttime <= 60
      cost = 100
    else
      cost = (ttime/60)*100 + 50
    end
    @rent.update(backtime: Time.now, price: cost)
    redirect_to rents_path, notice: "歸還成功"
  end

  def destroy
    @rent.destroy
    redirect_to rents_path, notice: "刪除完成"
  end

  private
  def clean_params
    params.require(:rent).permit(:customer_id, :bike_id)
  end

  def find_rent
    @rent = Rent.find_by(id: params[:id])
  end

  end
