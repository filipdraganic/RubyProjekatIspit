class UsersController < ApplicationController


  def index
    @user = User.find(current_user.id)
    if @user.admin
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'users/new'
    end

  end

  def makeAdmin

    @user = User.find(params[:nesto])
    puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    puts @user.admin
    if @user.admin
      @user.update(admin:false)
    else
      @user.update(admin: true)
    end

    puts @user.admin

    redirect_to users_path
  end

  def obrisi
    @user = User.find(params[:nesto])
    @korisnik = User.find(current_user.id)
    if @korisnik.admin
      @user.destroy
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end

end
