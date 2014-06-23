module NoCms
  module Admin
    module News
      module CategoriesHelper
        def category_listing_item_classes item, current
          classes = []
          classes << 'current' if current == item
          classes
        end
      end
    end
  end
end
