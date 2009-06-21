class UsersController < ApplicationController
  resources_controller_for :users

  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  def update
    self.resource = find_resource
    # [:login, :email].each { |p| params[resource_name][p] = resource[p] }
    # debugger
    @resource_saved = resource.update_attributes(params[resource_name])
  end

  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
end
