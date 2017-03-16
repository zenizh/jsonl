require 'jsonl/version'
require 'json'

module JSONL
  module_function

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

  def parse(source, opts = {})
    parsed = []
    source.each_line do |line|
      parsed << JSON.parse(line, opts)
    end
    parsed
  end
end
