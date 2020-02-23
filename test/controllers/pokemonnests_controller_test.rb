require 'test_helper'

class PokemonnestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokemonnests_index_url
    assert_response :success
  end

  test "should get show" do
    get pokemonnests_show_url
    assert_response :success
  end

end
