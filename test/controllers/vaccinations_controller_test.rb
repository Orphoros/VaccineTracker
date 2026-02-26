require "test_helper"

class VaccinationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vaccinations_index_url
    assert_response :success
  end
end
