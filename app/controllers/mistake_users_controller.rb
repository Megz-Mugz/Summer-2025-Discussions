class MistakeUsersController < ApplicationController
  before_action :set_mistake_user, only: %i[ show edit update destroy ]

  # GET /mistake_users or /mistake_users.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: MistakeUsersDatatable.new(view_context) }
    end
  end

  # GET /mistake_users/1 or /mistake_users/1.json
  def show
  end

  # GET /mistake_users/new
  def new
    @mistake_user = MistakeUser.new
  end

  # GET /mistake_users/1/edit
  def edit
  end

  # POST /mistake_users or /mistake_users.json
  def create
    @mistake_user = MistakeUser.new(mistake_user_params)

    respond_to do |format|
      if @mistake_user.save
        format.html { redirect_to mistake_user_url(@mistake_user), notice: "Mistake user was successfully created." }
        format.json { render :show, status: :created, location: @mistake_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mistake_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mistake_users/1 or /mistake_users/1.json
  def update
    respond_to do |format|
      if @mistake_user.update(mistake_user_params)
        format.html { redirect_to mistake_user_url(@mistake_user), notice: "Mistake user was successfully updated." }
        format.json { render :show, status: :ok, location: @mistake_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mistake_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mistake_users/1 or /mistake_users/1.json
  def destroy
    @mistake_user.destroy!

    respond_to do |format|
      format.html { redirect_to mistake_users_url, notice: "Mistake user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mistake_user
      @mistake_user = MistakeUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mistake_user_params
      params.require(:mistake_user).permit(:mistake_id, :user_id)
    end
end
