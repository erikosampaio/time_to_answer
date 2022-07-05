class WelcomeController < ApplicationController
  http_basic_authenticate_with name: "eriko", password: "123"
  
  def index
  end
end
