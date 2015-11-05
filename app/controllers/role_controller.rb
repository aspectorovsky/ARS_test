class RoleController < ApplicationController
  def index
    @role = Role.find(2)
  end
end
