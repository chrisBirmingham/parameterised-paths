# frozen_string_literal: true

require 'uri'

module Parameterised
  module Paths
    class Path
      # Path constructor
      # @param path [String]
      #   A potentially parameterised path
      def initialize(path)
        @original_path = path
        @parameterised = false
        @params = []
        @path = parse_path(path)
      end

      # Attempts to match a path against our parameterised path
      # @param path [String]
      #   The path we want to attempt to match
      # @return [PathMatch|nil]
      #   A PathMatch if we have encountered a match or nil when there
      #   if no match
      def match(path)
        unless @path.is_a?(Regexp)
          return @path == path ? PathMatch.new(@original_path) : nil
        end

        match = path.match(@path)

        return nil if match.nil?

        pos = 0
        param = {}
        match.captures.each do |capture|
          capture.sub!('/', '')
          param[@params[pos]] = capture
          pos += 1
        end

        PathMatch.new(@original_path, param)
      end

      private

      # Attempt to parse our given path
      # @param path [String]
      #   The path to parse
      # @return [Regexp|String]
      #   The original path if there are no parameters, Regexp if is did
      #   contain parameters
      def parse_path(path)
        # if we do not have param sections, just return the string
        return path unless path.include?('/:')

        path = path.gsub(%r{/:\w+}) do |m|
          m.sub!('/:', '')
          @params.push(m)
          '(/\w+)'
        end

        Regexp.new(path)
      end
    end
  end
end
