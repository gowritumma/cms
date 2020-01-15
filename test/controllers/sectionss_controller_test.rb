require 'test_helper'

class SectionssControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sectionss_index_url
    assert_response :success
  end

  test "should get show" do
    get sectionss_show_url
    assert_response :success
  end

  test "should get new" do
    get sectionss_new_url
    assert_response :success
  end

  test "should get edit" do
    get sectionss_edit_url
    assert_response :success
  end

  test "should get delete" do
    get sectionss_delete_url
    assert_response :success
  end

end
