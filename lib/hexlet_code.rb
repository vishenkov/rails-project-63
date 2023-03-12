# frozen_string_literal: true

require "hexlet_code/version"

module HexletCode
  autoload :Tag, "hexlet_code/tag.rb"
  # autoload "hexlet_code/version.rb"

  def self.form_for(_object, options = {})
    action = options[:url] || "#"

    yield if block_given?

    Tag.build("form", action: action, method: "post")
  end
end
