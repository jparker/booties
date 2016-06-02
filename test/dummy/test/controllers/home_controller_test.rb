require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  def test_page_renders_breadcrumbs
    get :breadcrumbs

    assert_select 'ol.breadcrumb' do
      assert_select 'li', 'Foo'
      assert_select 'li.active', 'Bar'
    end
  end

  def test_page_renders_btn_links
    get :button

    assert_select 'a.btn.btn-default', 'Foo'
    assert_select 'a.btn.btn-danger.btn-xs[data-method="delete"]', 'Sign out'
  end

  def test_page_renders_flags
    get :flag

    assert_select 'span.label.label-default', 'foo'
    assert_select 'span.label.label-primary', 'bar'
    assert_select 'span#baz.label.label-danger', 'baz'
  end

  def test_page_renders_badges
    get :badge

    assert_select 'span.badge', 'foo'
    assert_select 'span.badge.foo', 'bar'
    assert_select 'span.badge#foo', 'bar'
  end

  def test_page_renders_tooltips
    get :tooltip

    assert_select 'span[data-toggle="tooltip"][title="A tooltip"]',
      'This has a tooltip.'
    assert_select 'span[data-toggle="tooltip"][data-placement="left"][title="Another tooltip"]',
      'This has another tooltip.'
  end

  def test_page_renders_popovers
    get :popover

    assert_select 'button', text: 'Button text' do
      assert_select '[type="button"]'
      assert_select '[data-toggle="popover"]'
      assert_select '[data-content="Lorem ipsum dolor sit amet"]'
    end

    assert_select 'a', text: 'Link text' do
      assert_select '[role="button"]'
      assert_select '[data-container="body"]'
      assert_select '[data-toggle="popover"]'
      assert_select '[data-placement="right"]'
      assert_select '[data-trigger="focus"]'
      assert_select '[title="This is the title"]'
      assert_select '[data-content="Lorem ipsum dolor sit amet"]'
    end
  end

  def test_page_renders_a_modal
    get :modal

    assert_select 'div.modal.fade#confirm' do
      assert_select 'div.modal-dialog.modal-lg' do
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

  def test_page_renders_a_panel
    get :panel

    assert_select 'div.panel.panel-default' do
      assert_select 'div.panel-heading' do
        assert_select 'h3.panel-title', 'Default panel'
      end
      assert_select 'div.panel-body', 'Panel body'
      assert_select 'div.panel-footer', 'Panel footer'
    end

    assert_select 'fieldset.panel.panel-info' do
      assert_select 'div.panel-heading' do
        assert_select 'h3.panel-title', 'Panel with custom container and context'
      end
      assert_select 'table tr td', 'A table instead of a body'
      assert_select 'div.panel-footer', 'Panel footer'
    end
  end
end
