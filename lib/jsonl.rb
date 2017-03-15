require 'jsonl/version'
require 'json'

module JSONL
  module_function

  def parse(source, opts = {})
    parsed = []
    source.each_line do |line|
      parsed << JSON.parse(line, opts)
    end
    parsed
  end
end
