# frozen_string_literal: true

require "openapi3_parser/array_sentence"
require "openapi3_parser/error"

module Openapi3Parser
  module Validators
    class RequiredFields
      using ArraySentence
      private_class_method :new

      def self.call(*args)
        new.call(*args)
      end

      def call(validatable,
               required_fields:,
               raise_on_invalid: true)
        input = validatable.input
        missing_fields = required_fields.select { |name| input[name].nil? }

        return if missing_fields.empty?

        if raise_on_invalid
          location_summary = validatable.context.location_summary
          raise Openapi3Parser::Error::MissingFields,
                "Missing required fields for "\
                "#{location_summary}: #{missing_fields.sentence_join}"
        else
          validatable.add_error(
            "Missing required fields: #{missing_fields.sentence_join}"
          )
        end
      end
    end
  end
end
