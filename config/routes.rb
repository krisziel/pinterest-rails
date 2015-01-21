Rails.application.routes.draw do
  root 'profiles#index'
  get ':username' => 'profiles#profile', :format => 'json'
  get ':username/:board' => 'profiles#board', :format => 'json'
  get ':username.json' => 'profiles#profile', :format => 'json'
  get ':username/:board.json' => 'profiles#board', :format => 'json'
end
