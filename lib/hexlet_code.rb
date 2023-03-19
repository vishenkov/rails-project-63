# frozen_string_literal: true

module HexletCode
  autoload :Tag, "hexlet_code/tag.rb"
  autoload :FormBuilder, "hexlet_code/form_builder.rb"
  autoload :Version, "hexlet_code/version.rb"

  def self.form_for(object, options = {})
    form_builder = FormBuilder.new object

    yield form_builder if block_given?

    form_builder.build(options)
  end
end
