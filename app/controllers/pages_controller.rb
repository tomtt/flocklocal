class PagesController < ApplicationController
  def home
    @events = Event.all
  end
  
  def about

  end

  def first_flock

  end

  def success_stories
    
  end
end
