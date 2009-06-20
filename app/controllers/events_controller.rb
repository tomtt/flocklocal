class EventsController < ApplicationController
  resources_controller_for :events
  before_filter :login_required, :except => [:index, :show]
  after_filter :sign_up_for_own_event, :only => [:create]

  def show
    self.resource = find_resource
    @sure_attendees = resource.sure_attendees
    @maybe_attendees = resource.maybe_attendees
  end

  def create
    self.resource = new_resource
    self.resource.owner = current_user
    @resource_saved = resource.save
  end

  protected

  def sign_up_for_own_event
    current_user.attend_event(self.resource)
  end
end
