# coding: utf-8
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :employe_new]
  before_action :correct_user,   only: [:edit, :update, :show]
  before_action :admin_user,     only: [:index, :destroy]
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @micropost  = current_user.microposts.build
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = Individual.new
  end

  def create
    if params[:type] == "Individual"
      @user = Individual.new(user_params)
      if @user.save
        @user.send_activation_email
        flash[:info] = "Пожалуйста, проверьте ваш email чтобы активировать учётную запись."
        redirect_to root_url
      else
        flash[:info] = "Ошибка. Учётную запись создать не удалось."
        render 'new'
      end
    elsif params[:type] == "Corporate"
      logger.debug "user_params: #{user_params}"
      up2 = user_params
      up2["password"] = random_string
      logger.debug "user_params2: #{up2}"
      @user = Corporate.new(up2)
      @user.activated = 1
      @user.activated_at = Time.now
      @user.company_id = current_user.companies.first.id
      if @user.save
        flash[:info] = "Учётная запись сотрудника создана"
        redirect_to employes_path
      else
        flash[:info] = "Ошибка. Учётная запись сотрудника НЕ создана"
        render 'new_employe_user'
      end
    else
      flash[:info] = "Ошибка. Учётную запись создать не удалось. Нет типа."
      redirect_to root_url
    end

  end

  def edit
    if current_user.admin && params[:id].to_i != current_user.id
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Профиль обновлён"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удалён"
    redirect_to users_url
  end
  
  def employes
    if current_user.type == "Corporate"
      @company = Company.find(current_user.company_id)
      @users = User.where(:company_id => @company)
    else
      flash[:success] = "Вы не сотрудник компании"
      redirect_to root_url
    end
  end
  
  def employe_new
    @company = Company.find(current_user.company_id)
    if current_user.cadmin && current_user.company_id == @company.id
      @user = Corporate.new
    else
      flash[:success] = "Вы не сотрудник компании"
      redirect_to root_url
    end
  end

  def employe_edit
    @company = Company.find(current_user.company_id)
    if current_user.cadmin && current_user.company_id == @company.id
      @user = User.where("id = ? AND company_id = ?", params[:id], @company.id ).first
    else
      flash[:success] = "Вы не сотрудник компании"
      redirect_to root_url
    end
  end

  def employe_create
    @company = Company.find(current_user.company_id)
    if current_user.cadmin && current_user.company_id == @company.id
      up2 = user_params
      up2["password"] = random_string
      @user = Corporate.new(up2)
      @user.activated = 1
      @user.activated_at = Time.now
      @user.company_id = current_user.companies.first.id
      if @user.update_attributes(user_params)
        flash[:success] = "Учётная запись корпоративного пользователя создана"
        redirect_to employes_path
      else
        flash[:info] = "Ошибка. Учётная запись корпоративного пользователя НЕ создана"
        render 'new_employe_user'
      end
    else
      flash[:success] = "Вы не сотрудник компании"
      redirect_to root_url
    end
  end

  def employe_update
    @company = Company.find(current_user.company_id)
    if current_user.cadmin && current_user.company_id == @company.id
      @user = User.where("id = ? AND company_id = ?", params[:id], @company.id ).first
      if @user.update_attributes(user_params)
        flash[:success] = "Учётная запись корпоративного пользователя изменена"
        redirect_to employes_path
      else
        render 'employe_edit'
      end
    else
      flash[:success] = "Вы не сотрудник компании"
      redirect_to root_url
    end
  end

  def employe_destroy
    @company = Company.find(current_user.company_id)
    if current_user.cadmin && current_user.company_id == @company.id
      @user = User.where("id = ? AND company_id = ?", params[:id], @company.id ).first
      @user.destroy
      flash[:success] = "Корпоративный пользователь удалён"
      redirect_to employes_path
    else
      flash[:success] = "Вы не сотрудник компании"
      redirect_to root_url
    end
  end

  def search
  end

  def searchexec
    @users = nil
    unless params[:family].empty?
      @users = User.where("family like '%#{params[:family]}%'").paginate(page: params[:page])
    end
    unless params[:company].empty?
      @companies = Company.where("name like '%#{params[:company]}%'")
      arr = Array.new
      @companies.each do |c|
        arr << c.id
      end
      @users = User.where(company_id: arr).paginate(page: params[:page])
    end
    unless params[:email].empty? || params[:email] == "@"
      @users = User.where("email like '%#{params[:email]}%'").paginate(page: params[:page])
    end
  end
  
private

  def user_params
    if params[:type] == "Corporate"
      params.require(:corporate).permit(:name, :family, :otchestvo, :email, :password,
                                 :password_confirmation, :pdexeconfirm)
    elsif params[:type] == "Individual"
      params.require(:individual).permit(:name, :family, :otchestvo, :email, :password,
                                 :password_confirmation, :pdexeconfirm)
    else
      params.require(:user).permit(:name, :family, :otchestvo, :email, :password,
                                 :password_confirmation, :pdexeconfirm)
    end
  end

  def random_string(length=10)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ0123456789'
    password = ''
    length.times { password << chars[rand(chars.size)] }
    password
  end
  
end
