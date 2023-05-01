require "test_helper"

class HelloworldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @helloworld = helloworlds(:one)
  end

  test "should get index" do
    get helloworlds_url
    assert_response :success
  end

  test "should get new" do
    get new_helloworld_url
    assert_response :success
  end

  test "should create helloworld" do
    assert_difference("Helloworld.count") do
      post helloworlds_url, params: { helloworld: {  } }
    end

    assert_redirected_to helloworld_url(Helloworld.last)
  end

  test "should show helloworld" do
    get helloworld_url(@helloworld)
    assert_response :success
  end

  test "should get edit" do
    get edit_helloworld_url(@helloworld)
    assert_response :success
  end

  test "should update helloworld" do
    patch helloworld_url(@helloworld), params: { helloworld: {  } }
    assert_redirected_to helloworld_url(@helloworld)
  end

  test "should destroy helloworld" do
    assert_difference("Helloworld.count", -1) do
      delete helloworld_url(@helloworld)
    end

    assert_redirected_to helloworlds_url
  end
end
