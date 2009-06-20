class EventsController < ApplicationController
  resources_controller_for :events
  before_filter :login_required, :except => [:index, :show]
  after_filter :sign_up_for_own_event, :only => [:create]

  def create
    self.resource = new_resource
    self.resource.owner = current_user
    @resource_saved = resource.save
  end

  protected

  def sign_up_for_own_event
    self.resource.users << current_user
  end
end
