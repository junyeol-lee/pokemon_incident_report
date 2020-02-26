# frozen_string_literal: true

class PokemonnestsController < ApplicationController
  def index
    @nests = Pokemonnest.all
  end

  def show
    @nest = Pokemonnest.find(params[:id])
  end
end
