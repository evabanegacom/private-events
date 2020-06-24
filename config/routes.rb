Rails.application.routes.draw do
  resources :eventsusers
  resources :events
  resources :users, only: %i[new create show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: %i[new create destroy]
  root 'users#index'
end


# def new
# end

# def create
#   @event = Event.find(params[:event_id])
#   @invited_user = User.find(params[:user_id])

#   if @event.attendees.include?(@invited_user)
#     @invited_user.attended_events.delete(@event)
#     flash.notice = "Uninvited " + @invited_user.username + " from " + @event.description
#   else
#     @invited_user.attended_events.push(@event)
#     flash.notice = "Invited " + @invited_user.username + " to " + @event.description
#   end

#   #redirect_to event_path(@event.id)
#   redirect_to :new

# end

# def destroy
# end