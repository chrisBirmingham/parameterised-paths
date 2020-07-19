# frozen_string_literal: true

module Parameterised
  module Paths
    # Class describing a path match
    class PathMatch
      attr_reader :path, :params

      # @param path [String]
      #   The original path matched against
      # @param params [Hash]
      #   Any parameters matched within the path
      def initialize(path, params = {})
        @path = path
        @params = params
      end
    end
  end
end
