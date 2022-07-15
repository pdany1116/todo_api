# frozen_string_literal: true

module JsonHelpers
  class Parser
    def initialize(filename)
      @content = File.read(filename)
    end

    def to_hash
      JSON.parse(@content, symbolize_names: true)
    end
  end
end
