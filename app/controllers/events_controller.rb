class EventsController < ApplicationController

  def update
    if @listing.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @event.delete
    redirect_to root_path notice: "Event was successfully deleted."
  end
end
