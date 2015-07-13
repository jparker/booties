# [![Gem Version](https://badge.fury.io/rb/booties.svg)](http://badge.fury.io/rb/booties) [![Build Status](https://travis-ci.org/jparker/booties.svg?branch=master)](https://travis-ci.org/jparker/booties)

# Booties

Booties provides a variety of helpers for using [Twitter
Bootstrap](http://getbootstrap.com/) within a Rails application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'booties'
```

And then execute:

    $ bundle

Make the helpers available throughout your application by adding the following
line to your ApplicationController:

```ruby
helper Booties::Engine.helpers
```

Finally, you need to make sure you include Bootstrap in your application. One
easy way to do this is to include the
[bootstrap-sass](https://github.com/twbs/bootstrap-sass) gem.

## Helpers

Booties provides helpers for a variety of Bootstrap components.

### breadcrumbs

Booties::ApplicationHelper#breadcrumbs facilitates adding
[breadcrumbs](http://getbootstrap.com/components/#breadcrumbs) to your pages.
The breadcrumb content is saved as `:breadcrumbs` and can be rendered with
`yield :breadcrumbs`.

### flag

Booties::ApplicationHelper#flag provides Bootstrap
[labels](http://getbootstrap.com/components/#labels).
