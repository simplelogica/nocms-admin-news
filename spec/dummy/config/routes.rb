Rails.application.routes.draw do
  mount NoCms::Admin::Engine => "/admin"
  mount NoCms::Admin::News::Engine => "admin/news"
  mount NoCms::News::Engine => "news"
end
