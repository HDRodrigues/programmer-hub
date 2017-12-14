class ApplicationController < ActionController::Base
  # Verifica se está autenticado e redireciona caso contrario
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  protected
  
    #def after_sign_in_path_for(current_user)
    #  posts_path
    #end
  
    #def after_sign_up_path_for(current_user)
    #  posts_path
    #end
end
