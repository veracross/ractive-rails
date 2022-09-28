module Ractive
  module Rails
    class Engine < ::Rails::Engine
      config.before_initialize do |app|
        if Sprockets.respond_to?(:register_transformer)
          # Sprockets 4
          Sprockets.register_mime_type 'text/ractive', extensions: ['.rac', '.rac.erb', '.ractive']
          Sprockets.register_transformer 'text/ractive', 'application/javascript', Tilt
        elsif Sprockets.respond_to?(:register_engine)
          # Sprockets 2, 3 (old)
          args = ['.rac', Tilt]
          args << { mime_type: 'application/javascript', silence_deprecation: true } if Sprockets::VERSION.start_with?("3")
          Sprockets.register_engine(*args)

          args = ['.ractive', Tilt]
          args << { mime_type: 'application/javascript', silence_deprecation: true } if Sprockets::VERSION.start_with?("3")
          Sprockets.register_engine(*args)
        end
      end
    end
  end
end
