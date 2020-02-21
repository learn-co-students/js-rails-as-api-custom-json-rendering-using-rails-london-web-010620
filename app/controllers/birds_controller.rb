class BirdsController < ApplicationController
  # def index
  #   @birds = Bird.all
  #   render json: @birds
  # end
  def index
    birds = Bird.all
    # Both of the following render the same...just like when you use resources: 
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species}
    # render json: bird.slice(:id, :name, :species)
    # By using the following code, you recieve a response from the API rather than a general HTTP error
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end
end