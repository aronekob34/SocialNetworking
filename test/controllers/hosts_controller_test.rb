require 'test_helper'

class HostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hosts_index_url
    assert_response :success
  end

  test "should get new" do
    get hosts_new_url
    assert_response :success
  end

  test "should get edit" do
    get hosts_edit_url
    assert_response :success
  end

end
