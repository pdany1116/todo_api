# frozen_string_literal: true

module JsonHelpers
  class Formatter
    def initialize(filename)
      @content = File.read(filename)
    end

    def format_content(args)
      all_matchers = args.keys.join('|')
      non_string_matchers = (args.keys.select { |key| key unless args[key].is_a?(String) }).join('|')
      result = @content.gsub(/"{(#{non_string_matchers})}"/, '%{\1}').gsub(/{(!%#{all_matchers})}/, '%{\1}')

      format(result, args)
    end
  end
end
