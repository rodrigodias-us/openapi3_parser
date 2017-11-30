# frozen_string_literal: true

require "openapi3_parser/node/object"

module Openapi3Parser
  module Nodes
    # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#serverVariableObject
    class ServerVariable
      include Node::Object

      # @return [Nodes::Array, nil] a collection of String objects or nil
      def enum
        node_data["enum"]
      end

      # @return [String]
      def default
        node_data["default"]
      end

      # @return [String, nil]
      def description
        node_data["description"]
      end
    end
  end
end
