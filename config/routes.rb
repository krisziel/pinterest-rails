Rails.application.routes.draw do
  root 'profiles#index'
  get ':username' => 'profiles#profile'
  get ':username/:board' => 'profiles#board'
  get ':username.json' => 'profiles#profile'
  get ':username/:board.json' => 'profiles#board'
end
