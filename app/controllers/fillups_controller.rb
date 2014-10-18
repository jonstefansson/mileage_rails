class FillupsController < ApplicationController
  before_action :set_fillup, only: [:show, :edit, :update, :destroy]
  before_action :set_vehicle

  # GET /vehicles/1/fillups
  # GET /vehicles/1/fillups.json
  def index()
    limit = params['limit'] ? params['limit'].to_i : 10
    @fillups = Fillup.where('vehicle_id = ?', @vehicle.id).order('odometer DESC').limit(limit)
    calculate_mpgs(@fillups)
  end

  # GET /vehicles/1/fillups/1
  # GET /vehicles/1/fillups/1.json
  def show
  end

  # GET /vehicles/1/fillups/new
  def new
    @fillup = Fillup.new
  end

  # GET /vehicles/1/fillups/1/edit
  def edit
  end

  # POST /vehicles/1/fillups
  # POST /vehicles/1/fillups.json
  def create
    @fillup = Fillup.new(fillup_params)
    @fillup.vehicle = @vehicle

    respond_to do |format|
      if @fillup.save
        format.html { redirect_to vehicle_fillup_path(@vehicle.id, @fillup), notice: 'Fillup was successfully created.' }
        format.json { render :show, status: :created, location: @fillup }
      else
        format.html { render :new }
        format.json { render json: @fillup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1/fillups/1
  # PATCH/PUT /vehicles/1/fillups/1.json
  def update
    respond_to do |format|
      if @fillup.update(fillup_params)
        format.html { redirect_to vehicle_fillup_path(@vehicle.id, @fillup), notice: 'Fillup was successfully updated.' }
        format.json { render :show, status: :ok, location: @fillup }
      else
        format.html { render :edit }
        format.json { render json: @fillup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1/fillups/1
  # DELETE /vehicles/1/fillups/1.json
  def destroy
    @fillup.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_fillups_url(@vehicle.id), notice: 'Fillup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fillup
      @fillup = Fillup.find(params[:id])
    end

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fillup_params
      params.require(:fillup).permit(:vehicle_id, :odometer, :fill_date, :gallons)
    end

  def calculate_mpgs(fillups)
    fillups.inject() do |last_fillup, f|
      last_fillup.calculate_mpg(f) if last_fillup
      f
    end
  end

end
