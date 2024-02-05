Rails.application.routes.draw do
  # Rutas para Devise
  devise_for :users

  # Namespace para la API versión 1
  namespace :api do
    namespace :v1 do
      # Rutas para la autenticación JWT
      post 'auth/login', to: 'authentication_jwt#login'
      # delete 'auth/logout', to: 'authentication_jwt#logout'  # Si tienes una acción de logout
 

      # Rutas para Usuarios
      resources :users, only: %i[index show create update destroy] do
        # Rutas anidadas para Videos bajo Usuarios
        resources :videos, only: %i[index show create update destroy]

        # Rutas anidadas para Comentarios bajo Usuarios
        resources :comments, only: %i[index show create update destroy]

        # Rutas anidadas para LikeDislikes bajo Usuarios
        resources :like_dislikes, only: %i[index create destroy]
      end

      # Rutas para Videos
      resources :videos, only: %i[index show create update destroy] do
        # Rutas anidadas para Comentarios bajo Videos
        resources :comments, only: %i[index show create update destroy]

        # Rutas anidadas para LikeDislikes bajo Videos
        resources :like_dislikes, only: %i[index create destroy]
      end

      # Rutas para Comentarios
      resources :comments, only: %i[index show create update destroy] do
        # Rutas anidadas para LikeDislikes bajo Comentarios
        resources :like_dislikes, only: %i[index create destroy]
      end

      # Rutas para LikeDislikes
      resources :like_dislikes, only: %i[index create destroy]
    end
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Puedes definir aquí una ruta raíz si es necesario
  # root "main#index"
end
