class RegistrationsController < Devise::RegistrationsController

    private
  
      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :username,
            :profession, :service,:type)
      end
      
      def account_update_params
        params.require(:user).permit(:email, :password, :password_confirmation, :username, :status,
            :profession, :service)
      end

  end