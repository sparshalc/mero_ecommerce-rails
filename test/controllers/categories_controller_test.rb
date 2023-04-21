require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get mens_fashion" do
    get categories_mens_fashion_url
    assert_response :success
  end

  test "should get womens_fashion" do
    get categories_womens_fashion_url
    assert_response :success
  end

  test "should get electronics" do
    get categories_electronics_url
    assert_response :success
  end

  test "should get other" do
    get categories_other_url
    assert_response :success
  end
end
