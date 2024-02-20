require 'test_helper'
class AttractionsControllerTest <ActionDispatch::IntegrationTest

  test 'render a list of attractions' do
    get attractions_path
    assert_response :success
    assert_select '.attraction',2
  end

  test 'render a detailed attraction page' do
    get attraction_path(attractions(:Plaza))

    assert_response :success
    assert_select '.title', 'Plaza de armas'
    assert_select '.description', 'ubicado en el centro de la ciudad'
    assert_select '.location', 'Ver ubicacion'
  end

  test 'create a new attraction' do

  end

end
