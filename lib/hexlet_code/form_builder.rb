# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(object)
      @object = object
      @fields = []
    end

    def form(options, &block)
      action = options[:url] || "#"

      Tag.build("form", action: action, method: "post") do
        block&.call
      end
    end

    def submit(name = "Save")
      @fields << Tag.build("input", type: "submit", value: name)
    end

    def label(name, value = nil)
      value ||= name.to_s.capitalize
      @fields << Tag.build("label", for: name) { value }
    end

    def input(name, args = {})
      as_arg = args.fetch(:as, :input)
      tag_name = as_arg == :text ? "textarea" : "input"

      value = @object.public_send(name)

      tag_args = {
        name: name,
        type: args[:type] || "text",
        value: value,
        **args.except(:as)
      }.compact

      tag_name == "input" ? build_input(tag_args) : build_textarea(tag_args)
    end

    def build(options)
      form(options) do
        result_fields = @fields.join "\n"
        result_fields = "\n#{result_fields}\n" unless result_fields.empty?
        result_fields
      end
    end

    private

    def build_input(args)
      name = args[:name]
      label(name) unless name.nil?

      @fields << Tag.build("input", **args)
    end

    def build_textarea(args)
      tag_args = {
        **args.except(:value, :type),
        rows: args[:rows] || "20",
        cols: args[:cols] || "40"
      }

      @fields << Tag.build("textarea", **tag_args) { args[:value] }
    end
  end
end
