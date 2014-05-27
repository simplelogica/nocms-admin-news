Rails.application.routes.draw do

  mount NoCms::Admin::News::Engine => "/no_cms/admin/news"
end
