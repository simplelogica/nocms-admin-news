NoCms::Admin.menu_items << {
  name: 'news',
  url: proc { NoCms::Admin::News::Engine.routes.url_helpers.items_path },
  children: [
    {
      name: 'items',
      url: proc { NoCms::Admin::News::Engine.routes.url_helpers.items_path },
    },
    {
      name: 'categories',
      url: proc { NoCms::Admin::News::Engine.routes.url_helpers.categories_path },
    }
  ]
}
