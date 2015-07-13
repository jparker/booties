require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test 'page renders breadcrumbs' do
    get :show

    assert_select 'ol.breadcrumb' do
      assert_select 'li', 'Foo'
      assert_select 'li.active', 'Bar'
    end
  end

  test 'page renders flags' do
    get :show

    assert_select 'span.label.label-default', 'foo'
    assert_select 'span.label.label-primary', 'bar'
    assert_select 'span#baz.label.label-danger', 'baz'
  end
end
