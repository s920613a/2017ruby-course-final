class CustomersController < ApplicationController

  before_action :find_customer, only:[:edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def new
   @customer = Customer.new
  end

  def create
    @customer = Customer.new(clean_params)
    if @customer.save
     redirect_to customers_path, notice: "新增成功"
    else
     render "new" #new.html.erb
   end
  end

  def edit
  end

  def update
    if @customer.update(clean_params)
      redirect_to customers_path, notice: "修改成功"
    else
      render "edit"
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path, notice: "刪除完成"
  end

  private
  def clean_params
    params.require(:customer).permit(:cusNo, :cusName, :cusID, :cusTel)
  end

  def find_customer
    @customer = Customer.find_by(id: params[:id])
  end

end
