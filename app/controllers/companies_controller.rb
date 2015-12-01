# coding: utf-8
class CompaniesController < ApplicationController
  before_action :logged_in_user, only: [ :new, :edit, :create, :update, :destroy]
  before_action :admin_user, only: [:index]
 
  def index
    @companies = Company.all
  end

  def new
    @user = current_user
    @company = Company.new
  end

  def edit
    @user = current_user
    @company = Company.find(params[:id])
  end

  def create
    if current_user.companies.all.size == 0
      @company = current_user.companies.new(company_params)
      if @company.save
        current_user.type = "Corporate"
        current_user.company_id = @company.id
        current_user.cadmin = true
        current_user.save
        flash[:info] = "компания создана"
        redirect_to employe_new_path
      else
        flash[:danger] = "ERROR: создать компанию не удалось!"
        render 'new'
      end
    else
      flash[:danger] = "Ошибка. У вас уже есть зарегистрированная компания."
      redirect_to user_path(current_user)
    end
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      flash[:success] = "информация обновлёна"
      redirect_to edit_company_path(@company)
    else
      render 'edit'
    end
  end

  def destroy
    @company = current_user.companies.find(params[:id]).destroy
    flash[:success] = "компания удалёна"
    redirect_to companies_path
  end

private

  def company_params
    params.require(:company).permit(:name, :addr, :chiefname, :chiefpost)
  end
  
  
end
