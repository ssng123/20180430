Rails.application.routes.draw do
  get 'home/index' 

  get 'home/new'

  post 'home/create' => 'home#create'  
  # get이 아닌 post 방식으로 정보를 넘겨야 한다. 
  # 그런데 Token 어쩌고 오류가 생김. 
  # 이걸 home 태그 안에 안 넣어서 생긴 오류.

  root 'home#index'  # root를 지정


  get 'home/show/:post_id' => 'home#show'

  get 'home/destroy/:post_id' => 'home#destroy'
  # params = { post_id => } 모양으로 기다리고 있는 것.
  # 들어오는 값을 가지고 다음 행동으로 넘어가라 ? 


  get 'home/edit/:post_id' => 'home#edit'
  post 'home/update/:post_id' => 'home#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
