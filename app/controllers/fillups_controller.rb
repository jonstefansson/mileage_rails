class FillupsController < ApplicationController
  before_action :set_fillup, only: [:show, :edit, :update, :destroy]

  helper FillupsHelper

  # GET /vehicles/1/fillups
  # GET /vehicles/1/fillups.json
  def index()
    limit = params['limit'] ? params['limit'].to_i : 10
    @fillups = Fillup.where('vehicle_id = ?', params['vehicle_id']).order('odometer DESC').limit(limit)
    calculate_mpgs(@fillups)
  end

  # GET /fillups/1
  # GET /fillups/1.json
  def show
  end

  # GET /fillups/new
  def new
    @vehicles = Vehicle.all
    @fillup = Fillup.new
  end

  # GET /fillups/1/edit
  def edit
    @vehicles = Vehicle.all
  end

  # POST /fillups
  # POST /fillups.json
  def create
    @fillup = Fillup.new(fillup_params)

    respond_to do |format|
      if @fillup.save
        format.html { redirect_to @fillup, notice: 'Fillup was successfully created.' }
        format.json { render :show, status: :created, location: @fillup }
      else
        format.html { render :new }
        format.json { render json: @fillup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fillups/1
  # PATCH/PUT /fillups/1.json
  def update
    respond_to do |format|
      if @fillup.update(fillup_params)
        format.html { redirect_to @fillup, notice: 'Fillup was successfully updated.' }
        format.json { render :show, status: :ok, location: @fillup }
      else
        format.html { render :edit }
        format.json { render json: @fillup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fillups/1
  # DELETE /fillups/1.json
  def destroy
    @fillup.destroy
    respond_to do |format|
      format.html { redirect_to fillups_url, notice: 'Fillup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fillup
      @fillup = Fillup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fillup_params
      params.require(:fillup).permit(:vehicle_id, :odometer, :fill_date, :gallons)
    end

  private

  def calculate_mpgs(fillups)
    fillups.inject() do |last_fillup, f|
      last_fillup.calculate_mpg(f) if last_fillup
      f
    end
  end

end
