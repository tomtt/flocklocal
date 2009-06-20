class EventsController < ApplicationController
  resources_controller_for :events
  before_filter :login_required, :except => [:index, :show]

  def create
    self.resource = new_resource
    self.resource.owner = current_user
    @resource_saved = resource.save
  end
end
