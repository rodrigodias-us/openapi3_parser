# frozen_string_literal: true

require "support/node_object_factory"
require "support/helpers/context"

RSpec.describe Openapi3Parser::NodeFactory::SecurityRequirement do
  include Helpers::Context

  it_behaves_like "node object factory",
                  Openapi3Parser::Node::SecurityRequirement do
    let(:input) do
      {
        "petstore_auth" => %w[write:pets read:pets]
      }
    end

    let(:context) { create_context(input) }
  end
end
