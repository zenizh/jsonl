require 'jsonl/version'
require 'json'

module JSONL
  module_function

  # Generate a string formatted as JSONL from an array.
  #
  # ==== Attributes
  #
  # * +objs+ - an array consists of objects
  # * +opts+ - options passes to `JSON.generate`
  #
  # ==== Exapmles
  #
  #   users = User.all.map(&:attributes) #=> [{"id"=>1, "name"=>"Gilbert", ...}, {"id"=>2, "name"=>"Alexa", ...}, ...]
  #   generated = JSONL.generate(users)
  #
  def generate(objs, opts = nil)
    unless objs.is_a?(Array)
      raise TypeError, "can't generate from #{objs.class}"
    end

    generated = []
    objs.map do |obj|
      generated << JSON.generate(obj, opts)
    end
    generated.join("\n")
  end

  # Parse JSONL string and return as an array.
  #
  # ==== Attributes
  #
  # * +source+ - a string formatted as JSONL
  # * +opts+ - options passes to `JSON.parse`
  #
  # ==== Examples
  #
  #   source = File.read('source.jsonl')
  #   parsed = JSONL.parse(source)
  #
  def parse(source, opts = {})
    parsed = []
    source.each_line do |line|
      parsed << JSON.parse(line, opts)
    end
    parsed
  end
end
