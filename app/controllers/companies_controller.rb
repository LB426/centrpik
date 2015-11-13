# coding: utf-8
class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(company_params)
    if @course.save
      flash[:info] = "компания создана"
      redirect_to edit_company_path(@company)
    else
      flash[:danger] = "ERROR: создать компанию не удалось!"
      render 'new'
    end    
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(course_params)
      flash[:success] = "информация обновлёна"
      redirect_to edit_company_path(@company)
    else
      render 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id]).destroy
    flash[:success] = "компания удалёна"
    redirect_to companies_path
  end

private

  def company_params
    params.require(:company).permit(:name, :addr)
  end
  
  
end
