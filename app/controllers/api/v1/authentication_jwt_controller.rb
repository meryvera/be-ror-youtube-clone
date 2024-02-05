module Api
  module V1
    class AuthenticationJwtController < BaseController
      # Tus métodos de autenticación, por ejemplo:
      
      # POST /api/v1/auth/login
      def login
        user = User.find_for_authentication(email: params[:email])
        if user&.valid_password?(params[:password])
          token = generate_jwt_token_for(user)
          render json: { token: token, user: user }
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end

      private

      def generate_jwt_token_for(user)
        # Configura la expiración y los datos del payload según tus necesidades
        exp = 72.hours.from_now.to_i
        payload = { user_id: user.id, exp: exp }
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
      end
    end
  end
end
