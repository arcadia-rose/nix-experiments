class HelloworldsController < ApplicationController
  before_action :set_helloworld, only: %i[ show edit update destroy ]

  # GET /helloworlds or /helloworlds.json
  def index
    @helloworlds = Helloworld.all
  end

  # GET /helloworlds/1 or /helloworlds/1.json
  def show
  end

  # GET /helloworlds/new
  def new
    @helloworld = Helloworld.new
  end

  # GET /helloworlds/1/edit
  def edit
  end

  # POST /helloworlds or /helloworlds.json
  def create
    @helloworld = Helloworld.new(helloworld_params)

    respond_to do |format|
      if @helloworld.save
        format.html { redirect_to helloworld_url(@helloworld), notice: "Helloworld was successfully created." }
        format.json { render :show, status: :created, location: @helloworld }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @helloworld.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /helloworlds/1 or /helloworlds/1.json
  def update
    respond_to do |format|
      if @helloworld.update(helloworld_params)
        format.html { redirect_to helloworld_url(@helloworld), notice: "Helloworld was successfully updated." }
        format.json { render :show, status: :ok, location: @helloworld }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @helloworld.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /helloworlds/1 or /helloworlds/1.json
  def destroy
    @helloworld.destroy

    respond_to do |format|
      format.html { redirect_to helloworlds_url, notice: "Helloworld was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_helloworld
      @helloworld = Helloworld.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def helloworld_params
      params.fetch(:helloworld, {})
    end
end
