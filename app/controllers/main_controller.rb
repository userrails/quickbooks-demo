require 'yaml'

class MainController < ApplicationController
  def index
    params[:url] = ENV["host_uri"] + "token/"
  end
end
