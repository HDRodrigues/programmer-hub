class PagesController < ApplicationController
  # Essa pagina nao necessita de devise por ser uma página de aprsentação da aplicação
  skip_before_filter :authenticate_user!
  
  def home
  end
end