class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    # Callback para establecer un avatar predeterminado antes de guardar el usuario
    before_save :set_default_avatar

    private
  
    # Método para establecer el avatar predeterminado
    def set_default_avatar
      self.avatar ||= 'default_avatar.png'
    end
end
