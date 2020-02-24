class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: birds
    # specific attributes
    # render json: birds, only: [ :id, :name, :species ]
    # or using except for attributes to exclude
    # render json: birds, except: [ :created_at, :updated_at ]

    # here's what's actually happening w/out the Ruby magic
    # render json: birds.to_json(except: [:created_at, :updated_at ])
  end

  def show 
    @bird = Bird.find_by(id: params[:id])
    # specific parts of the json being sent 
    render json: bird {:id: bird.id, name: bird.name, species: bird.species }
    #or return a NEW hash with the various parts
    #slice won't work for an array of hashes - like the index
    render json: bird.slice(:id, :name, :species)
  end



#an example of how to write out a basic error in case of no id
def show 
  bird = Bird.find_by(id: params[:id])
    if bird 
      render bird.json: {id: bird.id, name: bird.name, species: bird.species}
    else 
      render {"Bird not found"}
  end
end