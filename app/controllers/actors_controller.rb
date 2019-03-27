class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end
  def new
    @actors = Actor.new
  end
  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      redirect_to actors_path notice: "El actor fue creado con éxito"
    else
      render :new
    end
  end
  private
  def actor_params
    params.require(:actor).permit(:name, :bio, :birth_date, :birth_place, :alive, :death_date, :death_place)
  end
end
