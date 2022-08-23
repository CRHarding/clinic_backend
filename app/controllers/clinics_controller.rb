class ClinicsController < ApplicationController
  before_action :set_clinic, only: %i[ show edit update destroy ]

  # GET /clinics or /clinics.json
  def index
    params[:lat] = params[:lat].to_f
    params[:lon] = params[:lon].to_f
    @clinics = Clinic.get_close_clinics(params[:lat], params[:lon])
    # @clinics.as_json.map {|elem| 
    #   elem.merge!()
    #   puts(elem)
    # }
    render :json => @clinics.as_json.map{|elem|elem.merge!("distance"=>3963.0*Math::acos(Math.sin(params[:lat]/57.295779513082323) * Math.sin(elem['lat']/57.295779513082323) + Math.cos(params[:lat]/57.295779513082323) * Math.cos(elem['lat']/57.295779513082323) * Math.cos((params[:lon]-elem['lon'])/57.295779513082323)))}
    
  end

  # GET /clinics/1 or /clinics/1.json
  def show

  end

  # GET /clinics/new
  def new
    @clinic = Clinic.new
  end

  # GET /clinics/1/edit
  def edit
  end

  # POST /clinics or /clinics.json
  def create
    @clinic = Clinic.new(clinic_params)

    respond_to do |format|
      if @clinic.save
        format.html { redirect_to clinic_url(@clinic), notice: "Clinic was successfully created." }
        format.json { render :show, status: :created, location: @clinic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinics/1 or /clinics/1.json
  def update
    respond_to do |format|
      if @clinic.update(clinic_params)
        format.html { redirect_to clinic_url(@clinic), notice: "Clinic was successfully updated." }
        format.json { render :show, status: :ok, location: @clinic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinics/1 or /clinics/1.json
  def destroy
    @clinic.destroy

    respond_to do |format|
      format.html { redirect_to clinics_url, notice: "Clinic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinic
      puts(@clinics)
    end

    # Only allow a list of trusted parameters through.
    def clinic_params
      params.require(:clinic).permit(:display_name, :status, :lon, :lat)
    end
end
