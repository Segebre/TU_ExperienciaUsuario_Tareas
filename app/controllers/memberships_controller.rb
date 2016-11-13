class MembershipsController < ApplicationController
  def index
    @memberships = Membership.order(:name)
  end

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)

    if @membership.save
      redirect_to memberships_path, notice: "Added Successfully!"
    else
      flash[:notice] = "Could not add membership"
      render :new
    end
  end

  def edit
    @membership = Membership.find(params[:id])
  end

  def update
    @membership = Membership.find(params[:id])

    if @membership.update_attributes(membership_params)
      redirect_to memberships_path, notice: "Updated Successfully!"
    else
      flash[:errors] = "Could not update post"
      render :new
    end
  end

  def destroy
    Membership.find(params[:id]).destroy
    redirect_to memberships_path, notice: "Successfully Destroyed!"
  end

  protected
    def membership_params
      params.require(:membership).permit(:name)
    end
end
