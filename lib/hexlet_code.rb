# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  module Tag
    SINGLE_TAGS = %w[br input hr].freeze

    def self.build(tag, attributes = {})
      result = "<#{tag}"

      attrs_str = build_attributes(attributes)
      result += " #{attrs_str}" unless attrs_str.empty?

      result += ">"

      body = yield if block_given?

      close_tag = SINGLE_TAGS.include?(tag) ? "" : "</#{tag}>"
      result += "#{body}#{close_tag}"

      result
    end

    def self.build_attributes(attributes = {})
      attrs_array = attributes.each_with_object([]) do |attribute, acc|
        key, value = attribute
        acc << "#{key}=\"#{value}\""
      end

      attrs_array.join " "
    end
  end
end
