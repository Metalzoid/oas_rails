require "test_helper"

module OasRails
  class UtilsTest < ActiveSupport::TestCase
    test "detect_test_framework" do
      result = OasRails::Utils.detect_test_framework
      assert_equal :fixtures, result
    end

    test "type_to_schema when String is passed" do
      result = OasRails::Utils.type_to_schema("String")
      expected = { "type" => "string" }
      assert_equal expected, result
    end

    test "type_to_schema when Integer is passed" do
      result = OasRails::Utils.type_to_schema("Integer")
      expected = { "type" => "number" }
      assert_equal expected, result
    end

    test "type_to_schema when Array of String is passed" do
      result = OasRails::Utils.type_to_schema("Array<String>")
      expected = { "type" => "array", "items" => { "type" => "string" } }
      assert_equal expected, result
    end

    test "hash to schema" do
      result = OasRails::Utils.hash_to_json_schema({ name: "String", coords: "Array<Float>" })
      assert result.key? :properties
      assert result.key? :type
    end
  end
end
