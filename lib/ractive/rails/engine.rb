module Ractive
  module Rails
    class Engine < ::Rails::Engine
      config.before_initialize do |app|
        Sprockets::Engines
        Sprockets.register_engine('.rac', Tilt, silence_deprecation: true)
        Sprockets.register_engine('.ractive', Tilt, silence_deprecation: true)
      end
    end
  end
end
