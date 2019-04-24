module Spec
  module Support
    module Doc
      OPTS = [:alert, :required, :defaults]

      def self.included(const)
        const.let(:empty) { {} }
        const.let(:defaults) { { language: 'ruby', os: ['linux'] } }
        const.let(:opts) { |ctx| ctx.metadata.select { |key, _| OPTS.include?(key) }.to_h }
      end

      def build_schema(schema)
        Travis::Yml::Doc::Schema.build(schema)
      end

      def build_value(value, opts = {})
        Travis::Yml::Doc::Value.build(nil, nil, value, opts)
      end

      def expand(node)
        Travis::Yml::Schema.expand(node)
      end
    end
  end
end