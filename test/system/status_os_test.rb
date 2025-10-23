require "application_system_test_case"

class StatusOsTest < ApplicationSystemTestCase
  setup do
    @status_o = status_os(:one)
  end

  test "visiting the index" do
    visit status_os_url
    assert_selector "h1", text: "Status os"
  end

  test "should create status o" do
    visit status_os_url
    click_on "New status o"

    fill_in "Descricao", with: @status_o.descricao
    click_on "Create Status o"

    assert_text "Status o was successfully created"
    click_on "Back"
  end

  test "should update Status o" do
    visit status_o_url(@status_o)
    click_on "Edit this status o", match: :first

    fill_in "Descricao", with: @status_o.descricao
    click_on "Update Status o"

    assert_text "Status o was successfully updated"
    click_on "Back"
  end

  test "should destroy Status o" do
    visit status_o_url(@status_o)
    click_on "Destroy this status o", match: :first

    assert_text "Status o was successfully destroyed"
  end
end
