class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # puts "where is the error? #{user_params}"
    if @user.save
      session[:user_id] = @user.id
      redirect_to :root
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end

end
