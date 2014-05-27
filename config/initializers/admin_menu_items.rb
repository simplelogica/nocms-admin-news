NoCms::Admin.menu_items << {
  name: 'items',
  url: proc { NoCms::Admin::News::Engine.routes.url_helpers.items_path }
}
