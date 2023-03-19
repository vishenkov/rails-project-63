# frozen_string_literal: true

require "spec_helper"

RSpec.describe HexletCode::Tag do
  it "should render simple tag" do
    expect(HexletCode::Tag.build("div")).to eq("<div></div>")
  end

  it "should render self closing tag" do
    expect(HexletCode::Tag.build("input")).to eq("<input>")
  end

  it "should render tag with attributes" do
    expect(HexletCode::Tag.build("input", type: "submit")).to eq("<input type=\"submit\">")
  end

  it "should render tag with body" do
    expect(HexletCode::Tag.build("div", class: "wrapper") { "text" }).to eq("<div class=\"wrapper\">text</div>")
  end
end
