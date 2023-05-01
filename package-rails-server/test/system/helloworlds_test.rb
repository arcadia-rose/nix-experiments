require "application_system_test_case"

class HelloworldsTest < ApplicationSystemTestCase
  setup do
    @helloworld = helloworlds(:one)
  end

  test "visiting the index" do
    visit helloworlds_url
    assert_selector "h1", text: "Helloworlds"
  end

  test "should create helloworld" do
    visit helloworlds_url
    click_on "New helloworld"

    click_on "Create Helloworld"

    assert_text "Helloworld was successfully created"
    click_on "Back"
  end

  test "should update Helloworld" do
    visit helloworld_url(@helloworld)
    click_on "Edit this helloworld", match: :first

    click_on "Update Helloworld"

    assert_text "Helloworld was successfully updated"
    click_on "Back"
  end

  test "should destroy Helloworld" do
    visit helloworld_url(@helloworld)
    click_on "Destroy this helloworld", match: :first

    assert_text "Helloworld was successfully destroyed"
  end
end
