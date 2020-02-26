# frozen_string_literal: true

class RequestsController < ApplicationController
  def index
    @requests = Request.all.page(params[:page]).per(10)
  end
  # Rails automatically loads the associated view:
  # app/views/request/index.html.erb

  def show
    @request = Request.find(params[:id])
    @pokemons = Pokemonwave.where(request_id: params[:id])
  end
end
