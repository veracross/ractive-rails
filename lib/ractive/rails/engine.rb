module Ractive
  module Rails
    class Engine < ::Rails::Engine
      config.before_initialize do |app|
        Sprockets.register_preprocessor('.rac', Tilt)
        Sprockets.register_preprocessor('.ractive', Tilt)
      end
    end
  end
end