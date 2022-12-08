Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  # delete "logout" , to:"users/sessions#destroy"
  
  #Additional Routes
 post "/admin/add_bulk_drops/import/drops", to:"drop#import"
 get '/cities', to: "drop#city"
 get '/province', to: "drop#province"
#-------------------------Reset Password-----------------------------
post 'users/forgotpassword', to: 'password#forgot'
post 'users/resetpassword', to: 'password#reset'
#----------------------------------------------------------------
  post "/users/collectDrop", to:"drop#collect"
  post "/users/updateUserPaymentStatus", to:"updatepayment#update"
  post "/users/createFeedback", to:"feedback#create"
  post "/users/castVote", to:"votes#castvote"
  post "/users/registerPoll", to:"poll#create"
  post "/users/changeAvatar", to:"getuserinformation#changeAvatar"
  get "/users/getFeedback", to:"feedback#index"
  get "/users/getUserInformation", to:"getuserinformation#show"
  get "/users/getDropLocations", to:"drop#show"
  get '/users/getTime', to: "utc#time"
  get '/users/getNGOs', to: "ngo#index"
  get '/users/getActivePolls', to: "poll#index"
  get '/users/testUTC', to: "utc#test"
  get '/users/leaderboard', to: "leaderboard#index"

end
