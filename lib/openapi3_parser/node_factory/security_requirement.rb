# frozen_string_literal: true

require "openapi3_parser/node_factory/map"

module Openapi3Parser
  module NodeFactory
    class SecurityRequirement < NodeFactory::Map
      def initialize(context)
        super(context, value_factory: NodeFactory::Array)
      end

      private

      def build_node(data)
        Node::SecurityRequirement.new(data, context)
      end
    end
  end
end
