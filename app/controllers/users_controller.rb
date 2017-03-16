class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :authorize_only_current_user_or_admin_priviledge!, only: [:edit, :update, :create, :destroy]
  before_action :set_user, only: [:edit, :update, :destroy, :approve]
  before_action :set_current_user, only: [:show]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @users = User.where("id != ? ", current_user.id).all.paginate(page: params[:page], per_page: 20)
    content_for :title, @user.name
  end

  def sign_up
    @user = User.new
    content_for :title, "Sign Up"
  end

  def approve
    @user.approve = false if @user.approve.nil?
    @user.approve = !@user.approve
    respond_to do |format|
      if @user.save
        format.html { redirect_to current_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render users_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def sign_up_create
    @user = User.new(user_params)
    @user.role = Role.find_by(level: 2)
    @user.approve = false
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :sign_up }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
    content_for :title, "New User"
  end

  # GET /users/1/edit
  def edit
    content_for :title, @user.name
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.role = Role.find_by(level: 2)
    @user.approve = false
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_current_user
      @user = User.find(current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
    end
end
