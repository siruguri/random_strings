require 'rubygems'
gem 'minitest'

require_relative "../lib/random_strings"
require "minitest/autorun"

describe RandomStrings do

  before do
    @default_generator=RandomStrings::Generator.new
  end


  describe "when initializing" do
    it "must correctly accept a config" do
      @generate=(RandomStrings::Generator.new do |config|
                   config.tld_list=['.nettld']
                 end)

      email = @generate.random_email

      (/.nettld$/).match(email).wont_be_nil
    end
  end

  describe "you can get a random email" do
    it "must be a reasonable email" do
      email = @default_generator.random_email
      (/[a-zA-Z0-9]+\@[a-zA-Z0-9]+\.(com|org|net)/.match(email)).wont_be_nil
    end
  end

  describe "when generating random string" do
    it "has a default length of 10" do
      str = @default_generator.random_string
      str.size.must_equal 10
    end

    it "can have a set length when initialized" do
      @set_gen=(RandomStrings::Generator.new do |config|
                  config.default_string_length=42
                end)

      str=@set_gen.random_string
      str.size.must_equal 42
    end
  end
end
