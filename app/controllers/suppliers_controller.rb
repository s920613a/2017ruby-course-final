class SuppliersController < ApplicationController
  before_action :find_supplier, only:[:edit, :update, :destroy, :show]

  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(clean_params)
    if @supplier.save
      redirect_to suppliers_path, notice: "新增成功"
    else
      render "new" #new.html.erb
    end
  end

  def edit
  end

  def update
    if @supplier.update(clean_params)
      redirect_to suppliers_path, notice: "修改成功"
    else
      render "edit"
    end
  end

  def destroy
    @supplier.destroy
    redirect_to suppliers_path, notice: "刪除完成"
  end

  private
  def clean_params
    params.require(:supplier).permit(:supNo, :supName, :supTel)
  end

  def find_supplier
    @supplier = Supplier.find_by(id: params[:id])
  end

end
