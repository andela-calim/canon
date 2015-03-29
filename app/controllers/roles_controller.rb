class RolesController < ApplicationController

  def edit_roles
    @user = User.find(params[:id])
    p 'Current user: ', @user
    @role_names = User.unique_roles(@user)
    @roles = Role::ROLE_NAMES
    respond_to do |format|
      # format.html
      format.js
    end
  end

  def update_roles

  end
end