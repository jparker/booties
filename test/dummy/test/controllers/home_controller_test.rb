require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test 'page renders breadcrumbs' do
    get :breadcrumbs

    assert_select 'ol.breadcrumb' do
      assert_select 'li', 'Foo'
      assert_select 'li.active', 'Bar'
    end
  end

  test 'page renders flags' do
    get :flag

    assert_select 'span.label.label-default', 'foo'
    assert_select 'span.label.label-primary', 'bar'
    assert_select 'span#baz.label.label-danger', 'baz'
  end

  test 'page renders a modal' do
    get :modal

    assert_select 'div.modal.fade#confirm' do
      assert_select 'div.modal-dialog' do
        assert_select 'div.modal-content' do
          assert_select 'div.modal-header' do
            assert_select 'button[class="close"][data-dismiss="modal"][type="button"]' do
              assert_select 'span[class="glyphicon glyphicon-remove"]'
            end
            assert_select 'h4.modal-title', 'Modal header'
          end
          assert_select 'div.modal-body' do
            assert_select 'p', 'Modal body'
          end
          assert_select 'div.modal-footer' do
            assert_select 'button[class="btn btn-default"][data-dismiss="modal"][type="button"]', 'Dismiss'
            assert_select 'a[class="btn btn-primary"][href="#"]', 'Confirm'
          end
        end
      end
    end
  end
end
