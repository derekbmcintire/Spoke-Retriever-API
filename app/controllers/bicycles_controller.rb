class BicyclesController < OpenReadController
  before_action :set_bicycle, only: %i[update destroy]

  # GET /bicycles
  def index
    @bicycles = Bicycle.all

    render json: @bicycles
  end

  # GET /bicycles/1
  def show
    render json: Bicycle.find(params[:id])
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
    params.require(:bicycle).permit(:make, :model, :color, :serial_number, :size)
  end
end
