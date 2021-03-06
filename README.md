# [![Gem Version](https://badge.fury.io/rb/booties.svg)](http://badge.fury.io/rb/booties) [![Build Status](https://travis-ci.org/jparker/booties.svg?branch=master)](https://travis-ci.org/jparker/booties)

# Booties

Booties provides a variety of helpers for using
[Twitter Bootstrap](http://getbootstrap.com/) within a Rails application.

NB: This is the Rails 5 development branch. There will likely be no visible
change in syntax or behavior, but some of the tests had to be rewritten.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'booties'
```

And then execute:
```bash
$ bundle
```

You also need to make sure you include Bootstrap in your application. The way
you accomplish this is left up to you, but one easy way to do this is to
include the [bootstrap-sass](https://github.com/twbs/bootstrap-sass) gem.

## Helpers

Booties provides helpers for a variety of Bootstrap components. Below is an
overview of the available helpers. Examples of how to use them can be found in
<tt>test/dummy/app/views/samples</tt>.

### Badges

Booties::BadgeHelper#badge provides Bootstrap
[Badges](http://getbootstrap.com/components/#badges).

```erb
<%= badge '42' %>
```

### Breadcrumbs

Booties::ApplicationHelper#breadcrumbs facilitates adding
[Breadcrumbs](http://getbootstrap.com/components/#breadcrumbs) to your pages.
The breadcrumb content is saved as `:breadcrumbs` and can be rendered with
`yield :breadcrumbs`.

```erb
<%= breadcrumbs do %>
  <li><%= link_to 'Books', :books %></li>
  <li><%= link_to truncate(@book.title), [:edit, @book] %></li>
  <li class="active">Edit</li>
<% end %>
```

### Buttons

Booties::ButtonHelper#btn_link_to renders links configured to be displayed as
Bootstrap [Buttons](http://getbootstrap.com/css/#buttons).

```erb
<%= btn_link_to 'New', [:new, :widget] %>
<%= btn_link_to sign_out_path, class: 'btn-xs', context: :danger, method: :delete do %>
  Sign out
<% end %>
```

### Labels

Booties::FlagHelper#flag provides Bootstrap
[Labels](http://getbootstrap.com/components/#labels).

```erb
<%= flag 'PENDING' %>
<%= flag 'OPEN', context: :primary %>
<%= flag 'CLOSED', context: :danger %>
```

### Modals

Booties::ModalHelper#modal and Booties::Modal provide Bootstrap
[Modals](http://getbootstrap.com/javascript/#modals).

```erb
<%= modal 'foo' do |m| %>
  <%= m.header do %>
    Nesciunt qui iste vel a.
  <% end %>
  <%= m.body do %>
    <p>
      Autem atque perferendis veritatis. Molestiae aliquid nam reiciendis
      recusandae facere. Aut non nemo dicta.
    </p>
  <% end %>
  <%= m.footer do %>
    <%= m.dismiss class: 'btn btn-default' do %>
      Dismiss
    <% end %>
    <%= link_to @widget, class: 'btn btn-danger', method: :delete do %>
      Really Delete
    <% end %>
  <% end %>
<% end %>
```
### Panel

Booties::PanelHelper#panel and Booties::Modal provide Bootstrap
[Panels](http://getbootstrap.com/components/#panels).

```erb
<%= panel do |p| %>
  <%= p.heading do %>
    <%= p.title 'Consequatur quibusdam quia vel et sed in.' %>
  <% end %>
  <%= p.body do %>
    <p>
      Est fuga iste reiciendis laudantium dicta. Perspiciatis vero ut autem
      quod vel modi. Ea error omnis aliquam aut est.
    </p>
  <% end %>
  <%= p.footer do %>
    Voluptatibus rerum et est quo dicta perspiciatis.
  <% end %>
<% end %>
```

### Tooltips

Booties::TooltipHelper#tooltip provides Bootstrap
[Tooltips](http://getbootstrap.com/javascript/#tooltips).

```erb
<%= tooltip title: 'This is a tooltip', placement: :bottom do %>
  This has a tooltip.
<% end %>
```

Tooltip behavior is opt-in. The helper will render the necessary tag, but you
must activate them yourself. One way of doing this is to run the following
Javascript snippet:

```javascript
$(function() {
  $('[data-toggle="tooltip"]').tooltip();
}
```

### Popovers

Booties::PopoverHelper#popover provides Bootstrap
[Popovers](http://getbootstrap.com/javascript/#popovers).

```erb
<%= popover content: 'Lorem ipsum dolor sit amet.', class: 'btn btn-default' do %>
  Button text
<% end %>
```

Popover behavior is opt-in. The helper will render the necessary tag, but you
must activate them yourself. One way of doing this is to run the following
Javascript snippet:

```javascript
$(function() {
  $('[data-toggle="popover"]').popover();
}
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
