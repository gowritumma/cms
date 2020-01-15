class AdminUsersController < ApplicationController
  before_action :get_admin_user,  only: [:edit, :update, :delete, :destroy]
  before_action :confirm_logged_in
  def index
  	@admin_users = AdminUser.sorted
  end

  def new
  	@admin_user = AdminUser.new
  end

  def create
  	@admin_user = AdminUser.new(params_admin_user)
  	if @admin_user.save
  		flash[:notice] = "User created successfully."
  		redirect_to(access_menu_path)
  	else
  		render('new')
  	end
  end

  def edit
  	
  end

  def update
  	 if(@admin_user.update_attributes(params_admin_user))
      flash[:notice] = "User updated Successfully. "
      redirect_to(access_menu_path)
    else
      render('edit')
    end
  end

  def delete

  end

  def destroy
  	@admin_user.destroy
  	flash[:notice] = "User deleted Successfully. "
    redirect_to(access_menu_path)
  end

  private

  def get_admin_user
	@admin_user = AdminUser.find(params[:id])
  end
  def params_admin_user
  	params.require(:admin_user).permit(:firstname, :lastname, :email, :password, :username)
  end
end
