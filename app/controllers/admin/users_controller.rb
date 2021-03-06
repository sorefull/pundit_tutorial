class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    authorize [:admin, @users]
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize [:admin, @user]
  end

  # GET /users/new
  def new
    @user = User.new
    authorize [:admin, @user]
  end

  # GET /users/1/edit
  def edit
    authorize [:admin, @user]
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params.merge(password: SecureRandom.base64))
    authorize [:admin, @user]

    respond_to do |format|
      if @user.save
        format.html { redirect_to [:admin, @user], notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize [:admin, @user]
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to [:admin, @user], notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize [:admin, @user]
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email)
    end
end
