class EventsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @hosted_events = current_user.hosted_events
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
