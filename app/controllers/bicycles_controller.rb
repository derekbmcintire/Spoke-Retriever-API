class BicyclesController < OpenReadController
  before_action :set_bicycle, only: %i[update destroy recover]

  # GET /bicycles
  def index
    @bicycles = Bicycle.all.order(created_at: :desc)

    render json: @bicycles
  end

  # GET /mine
  def mine
    render json: current_user.bicycles.all.order(created_at: :desc)
  end

  # GET /stolen
  def stolen
    render json: @bicycle.events.order(:created_at).last&.where('event_type="stolen"')
  end

  def recover
    @bicycle.events.last.destroy
  end

  # POST /bicycles
  def create
    @bicycle = current_user.bicycles.build(bicycle_params)

    if @bicycle.save
      render json: @bicycle, status: :created, location: @bicycle
    else
      render json: @bicycle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bicycles/1
  def update
    if @bicycle.update(bicycle_params)
      render json: @bicycle
    else
      render json: @bicycle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bicycles/1
  def destroy
    @bicycle.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bicycle
    @bicycle = current_user.bicycles.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def bicycle_params
    params.require(:bicycle).permit(:make, :model, :color, :serial_number, :size, :url)
  end
end
