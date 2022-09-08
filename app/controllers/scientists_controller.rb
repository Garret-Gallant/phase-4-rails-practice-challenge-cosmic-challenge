class ScientistsController < ApplicationController

  def index
    render json: Scientist.all
  end

  def show
    scientist = find_scientist
    render json: scientist, serializer: ShowScientistWithPlanetsSerializer, status: 200
  end

  def create
    scientist = Scientist.create!(scientist_params)
    render json: scientist, status: :created
  end

  def update
    scientist = find_scientist
    scientist.update!(scientist_params)
    render json: scientist, status: 202
  end

  def destroy
    scientist = find_scientist
    scientist.destroy
    head :no_content, status: :no_content
  end

private

def scientist_params
  params.permit(:name, :field_of_study, :avatar)
end

def find_scientist
  Scientist.find(params[:id])
end

end
