require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  def test_badges
    get samples_badges_url
    assert_select 'span.badge', '101'
    assert_select 'span.badge.foo', '42'
  end

  def test_breadcrumbs
    get samples_breadcrumbs_url
    assert_select 'ol.breadcrumb' do
      assert_select 'li:first-child a', 'Foo'
      assert_select 'li:last-child.active', 'Bar'
    end
  end

  def test_buttons
    get samples_buttons_url
    assert_select 'a.btn.btn-default', 'Foo'
    assert_select 'a.btn.btn-danger.btn-xs[data-method="delete"]', 'Bar'
  end

  def test_dropdowns
    get samples_dropdowns_url
    assert_select 'a.dropdown-toggle[role="button"][data-toggle="dropdown"]',
      'Foo'
    assert_select 'ul.dropdown-menu' do
      assert_select 'li', 'Foo'
    end
  end

  def test_flags
    get samples_flags_url
    assert_select 'span.label.label-default', 'Foo'
    assert_select 'span.label.label-primary.foo', 'Bar'
  end

  def test_modals
    get samples_modals_url
    assert_select 'div.modal.fade#foo' do
      assert_select 'div.modal-dialog.modal-lg' do
        assert_select 'div.modal-content' do
          assert_select 'div.modal-header' do
            assert_select 'button.close[data-dismiss="modal"][type="button"]', '×'
            assert_select 'h4.modal-title', 'Title'
          end
          assert_select 'div.modal-body' do
            assert_select 'p', 'Body'
          end
          assert_select 'div.modal-footer' do
            assert_select 'button.btn.btn-default[data-dismiss="modal"][type="button"]', 'Dismiss'
            assert_select 'a.btn.btn-primary[href="/bar"]', 'Confirm'
          end
        end
      end
    end
  end

  def test_panels
    get samples_panels_url

    assert_select 'div.panel.panel-default' do
      assert_select 'div.panel-heading' do
        assert_select 'h3.panel-title', 'Title'
      end
      assert_select 'div.panel-body', 'Body'
      assert_select 'div.panel-footer', 'Footer'
    end

    assert_select 'div.panel.panel-info' do
      assert_select 'div.panel-heading' do
        assert_select 'h3.panel-title', 'Title'
      end
      assert_select 'table caption', 'Use table instead of .panel-body'
    end
  end

  def test_popovers
    get samples_popovers_url

    assert_select 'button', text: 'Text' do
      assert_select '[type="button"]'
      assert_select '[data-toggle="popover"]'
      assert_select '[data-content="Lorem ipsum dolor sit amet"]'
    end

    assert_select 'a', text: 'Text' do
      assert_select '[role="button"]'
      assert_select '[data-toggle="popover"]'
      assert_select '[data-placement="right"]'
      assert_select '[data-trigger="focus"]'
      assert_select '[title="Lorem ipsum dolor sit amet"]'
      assert_select '[data-content="Occaecati corrupti atque quasi sit"]'
    end
  end

  def test_tooltips
    get samples_tooltips_url
    assert_select 'span[data-toggle="tooltip"][title="Lorem ipsum dolor sit amet"]', 'Lorem ipsum…'
  end
end
