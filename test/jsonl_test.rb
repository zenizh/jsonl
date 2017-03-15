require 'test_helper'
require 'json'

class JSONLTest < Minitest::Test
  def setup
    @source = File.read(File.expand_path('../fixtures/source.jsonl', __FILE__))
    @parsed = JSONL.parse(@source)
  end

  def test_parsed_class
    assert_equal Array, @parsed.class
  end

  def test_parsed_count
    assert_equal 4, @parsed.count
  end

  def test_parsed_equals_to_json_parse
    source = @source.split("\n")[0]
    assert_equal JSON.parse(source), @parsed[0]
  end
end
