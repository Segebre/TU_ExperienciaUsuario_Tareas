class CharactersController < ApplicationController
  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to @character, notice: "Added Successfully!"
    else
      flash[:errors] = "Could not register character"
      render :new
    end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])

    if @character.update_attributes(character_params)
      redirect_to @character, notice: "Updated Successfully!"
    else
      flash[:errors] = "Could not update character"
      render :new
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  def destroy
    Character.find(params[:id]).destroy
    redirect_to root_path, notice: "Successfully Destroyed!"
  end

  protected
    def character_params
      params.require(:character).permit(:name, :role, :email, :avatar_url)
    end
end
