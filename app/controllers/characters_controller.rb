class CharactersController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create, :show, :destroy]

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      session[:user_id] = @character.id
      redirect_to character_path, notice: "Added Successfully!"
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
      @character = current_user
  end

  def destroy
    Character.find(params[:id]).destroy
    redirect_to root_path, notice: "Successfully Destroyed!"
  end

  def posts
    @character = Character.find(params[:id])
    @posts = Post.where(character_id: @character.id).order(:created_at).reverse
  end

  protected
    def character_params
      params.require(:character).permit(:id, :name, :role, :email, :avatar_url, :membership_id, :password, :password_confirmation)
    end
end
