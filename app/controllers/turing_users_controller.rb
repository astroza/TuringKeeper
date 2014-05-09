class TuringUsersController < ApplicationController
  before_action :set_turing_user, only: [:show, :edit, :update, :destroy]
 # before_filter :authenticate_user!
  load_and_authorize_resource :except => [:create]
  def user_exists
    result = TuringUser.where(:identifier => params[:identifier])
    ret = result.count > 0
    checkin = true
    if ret
      result = CheckIn.where(:turing_user_id => result.first.id, :check_out_id => nil)
      if result.count > 0
        checkin = false
      end
    end
    render json: {:exists => ret, :checkin => checkin}
  end
  
  def user_verify
    result = TuringUser.where(:identifier => params[:identifier], :password => params[:password])
    ret = result.count > 0
    render json: {:ok => ret}
  end
  
  # GET /turing_users
  # GET /turing_users.json
  def index
    @turing_users = TuringUser.all
  end

  # GET /turing_users/1
  # GET /turing_users/1.json
  def show
  end

  # GET /turing_users/new
  def new
    @turing_user = TuringUser.new
  end

  # GET /turing_users/1/edit
  def edit
  end

  # POST /turing_users
  # POST /turing_users.json
  def create
    @turing_user = TuringUser.new(turing_user_params)

    respond_to do |format|
      if @turing_user.save
        format.html { redirect_to @turing_user, notice: 'Turing user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @turing_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @turing_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turing_users/1
  # PATCH/PUT /turing_users/1.json
  def update
    respond_to do |format|
      if @turing_user.update(turing_user_params)
        format.html { redirect_to @turing_user, notice: 'Turing user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @turing_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turing_users/1
  # DELETE /turing_users/1.json
  def destroy
    @turing_user.destroy
    respond_to do |format|
      format.html { redirect_to turing_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turing_user
      @turing_user = TuringUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def turing_user_params
      params.require(:turing_user).permit(:identifier, :FirstName, :LastName, :password)
    end
end
