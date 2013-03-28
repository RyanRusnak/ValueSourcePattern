# encoding: UTF-8

module Value
  module Source

    # The base class for various value sources (script, text, list, static),
    # containing a single value or a list of values.
    class BaseValueSource
      include Value::Log

      BLANK_STRING = ''.freeze

      attr_reader   :specification, :text_value, :text_value_or_blank, :text_values, :presentation_item, :data, :klass, :params, :value
      attr_accessor :user

      @@types = {}

      def self.register(name, vs={})
        @@types[[name, vs]] = self
      end

      @@value_sources = []
      def self.register(*args, klass)
        @@value_sources << [args, klass]
      end

      def post_init
        # post processing
      end
      
      def params(params)
        @params = params
      end

      # Initialize a new ValueSource expression parser. This is called when the
      # application is first started as well as for stream restarts during
      # development or dynamic loading.
      def create_parser
        @parser = Parser.new.tap do |p|
          # some parser
        end
      end

      def reset
        create_parser
      end

      def initialize(name, &block)
        instance_eval(&block)
        raise "value required for #{@name}" unless @data
        raise "klass required for #{@name}" unless @klass
        #raise "must define at least one application" if @applications.empty?
      end

      def value(value)
        @data = value
      end

      # TODO: Create a new controller instance to process the value source.
      def process
        begin
          Object.const_get('Value').const_get('Source').const_get(@klass).new().process
        rescue Forbidden
          #log.warn("Authorization failed for #{klass}")
          puts "Authorization failed for #{klass}"
        rescue Exception => e
          #log.error("Error processing value source: #{e.message}")
          puts "Error processing value source: #{e.message}"
        end
      end

      def klass(klass)
        @klass = klass
      end

      def specification(spec)

      end

      def send_error(condition, obj=nil)
        puts "#{condition}"
      end

    end
  end
end