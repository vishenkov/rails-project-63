# frozen_string_literal: true

User = Struct.new(:name, :job, keyword_init: true)

RSpec.describe HexletCode do
  it "has a version number" do
    expect(HexletCode::VERSION).not_to be nil
  end

  context "form_for" do
    it "creates form" do
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
  end
end
