Rails.application.routes.draw do
  root 'profiles#index'
  get ':username.json' => 'profiles#show', :format => 'json'
  get ':username/:board.json' => 'profiles#board', :format => 'json'
end
