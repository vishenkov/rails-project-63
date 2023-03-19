# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require "spec_helper"

User = Struct.new(:name, :job, keyword_init: true)

RSpec.describe HexletCode do
  it "has a version number" do
    expect(HexletCode::VERSION).not_to be nil
  end

  context "form_for" do
    it "creates default form" do
      user = User.new name: "rob"
      form = HexletCode.form_for user

      expect(form).to eq("<form action=\"#\" method=\"post\"></form>")
    end

    it "provide correct url" do
      url = "foo.bar/"
      user = User.new name: "rob"
      form = HexletCode.form_for user, url: url

      expect(form).to eq("<form action=\"#{url}\" method=\"post\"></form>")
    end

    it "should accept a block" do
      user = User.new name: "rob"
      form = HexletCode.form_for user do |f|
      end

      expect(form).to eq("<form action=\"#\" method=\"post\"></form>")
    end

    it "should render textarea with defualt attributes" do
      user = User.new name: "rob"
      form = HexletCode.form_for user do |f|
        f.input :job, as: :text
      end

      expect(form).to eq(Spec::Helpers.read_fixture("textarea_default_form.html").read)
    end

    it "should render textarea with attributes" do
      user = User.new name: "rob", job: "code"
      form = HexletCode.form_for user do |f|
        f.input :job, as: :text, rows: 50, cols: 50
      end

      expect(form).to eq(Spec::Helpers.read_fixture("textarea_form.html").read)
    end

    it "should render label for input" do
      user = User.new name: "rob", job: "code"
      form = HexletCode.form_for user do |f|
        f.input :job
      end

      expect(form).to eq(Spec::Helpers.read_fixture("input_form.html").read)
    end

    it "should render complex form" do
      user = User.new job: 'hexlet'

      form = HexletCode.form_for user do |f|
        f.input :name
        f.input :job
        f.submit
      end

      expect(form).to eq(Spec::Helpers.read_fixture("complex_form.html").read)
    end
  end
end

# rubocop:enable Metrics/BlockLength
