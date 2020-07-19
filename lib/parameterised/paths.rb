# frozen_string_literal: true

module Parameterised
  module Paths
    autoload :VERSION, 'parameterised/paths/version'
    autoload :Path, 'parameterised/paths/path'
    autoload :PathMatch, 'parameterised/paths/path_match'

    # Shorthand method to create a Path object
    # @param path [String]
    # @return [Path]
    def self.path(path)
      Path.new(path)
    end

    # Attempts to match two paths together
    # @param path [String]
    # @param other_path [String]
    # @return [PathMatch|nil]
    #   A PathMatch if a match is made or nil for no match
    def self.path_match(path, other_path)
      Path.new(path).match(other_path)
    end
  end
end
