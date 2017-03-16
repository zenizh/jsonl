require 'test_helper'
require 'json'

class JSONLTest < Minitest::Test
  def setup
    @source = File.read(File.expand_path('../fixtures/source.jsonl', __FILE__))
    @parsed = JSONL.parse(@source)
    @generated = JSONL.generate(@parsed)
  end

  def test_generate_type_error
    e = assert_raises(TypeError) { JSONL.generate('invalid type') }
    assert_equal 'can\'t generate from String', e.message
  end

  def test_generate_generated_type
    assert_instance_of String, @generated
  end

  def test_generate_generated_count
    assert_equal 4, @generated.split("\n").count
  end

  def test_generate_generated_can_parse
    assert JSONL.parse(@generated)
  end

  def test_generate_parsed_equals_to_the_original
    assert_equal @parsed, JSONL.parse(@generated)
  end

  def test_parse_parsed_class
    assert_instance_of Array, @parsed
  end

  def test_parse_parsed_count
    assert_equal 4, @parsed.count
  end

  def test_parse_parsed_equals_to_json_parse
    source = @source.split("\n")[0]
    assert_equal JSON.parse(source), @parsed[0]
  end
end
