require 'tilt'
module Ractive
  module Rails
    class Tilt < Tilt::Template
      def self.default_mime_type
        'application/javascript'
      end

      def self.ractive_template(file_name, source_data)
        <<-TEMPLATE
          this.RactiveTemplates || (this.RactiveTemplates = {});
          this.RactiveTemplates['#{file_name}'] = #{Ractive.parse(source_data).to_json};
        TEMPLATE
      end

      def self.call(input)
        file_name = input[:name]
        ractive_output = input[:data]
        { data: ractive_template(file_name, ractive_output) }
      end

      def prepare

      end

      def evaluate(scope, locals, &block)
        ractive_template(scope.logical_path, data)
      end
    end
  end
end
