# frozen_string_literal: true

module Spec
  class Helpers
    class << self
      def read_fixture(name)
        Pathname.new(File.join("./spec/fixtures", name))
      end
    end
  end
end
