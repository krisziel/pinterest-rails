Rails.application.routes.draw do
  root 'profiles#index'
  get ':username' => 'profiles#profile', :format => 'js'
  get ':username/:board' => 'profiles#board', :format => 'js'
  get ':username.json' => 'profiles#profile', :format => 'js'
  get ':username/:board.json' => 'profiles#board', :format => 'js'
end
