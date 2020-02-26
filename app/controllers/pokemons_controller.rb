# frozen_string_literal: true

class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @nest = Pokemonnest.find(@pokemon.pokemonnest_id)
  end
end
