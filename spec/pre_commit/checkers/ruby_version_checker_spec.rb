require "spec_helper"
require "support/shared_examples.rb"

load "pre_commit/checkers/ruby_version_checker.rb"

RSpec.describe RubyVersionChecker do
  context "with .ruby-version" do
    subject(:checker) { RubyVersionChecker.new(file: ".ruby-version", force_pref_on: true) }
    it_should_behave_like "it finds an error"
  end

  context "with .rbenv-version" do
    subject(:checker) { RubyVersionChecker.new(file: ".rbenv-version", force_pref_on: true) }
    it_should_behave_like "it finds an error"
  end

  context "with no version-related files" do
    subject(:checker) { RubyVersionChecker.new(file: "bar.rb", force_pref_on: true) }
    it_should_behave_like "it finds no error"
  end
end
