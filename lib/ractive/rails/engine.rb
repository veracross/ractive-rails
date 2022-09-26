module Ractive
  module Rails
    class Engine < ::Rails::Engine
      config.before_initialize do |app|
        Sprockets.register_mime_type 'text/ractive', extensions: ['.rac', '.ractive']
        Sprockets.register_preprocessor 'text/ractive', Tilt
      end
    end
  end
end