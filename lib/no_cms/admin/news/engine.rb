module NoCms
  module Admin
    module News
      class Engine < ::Rails::Engine
        isolate_namespace NoCms::Admin::News
      end
    end
  end
end
