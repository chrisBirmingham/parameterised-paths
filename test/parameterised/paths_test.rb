# frozen_string_literal: true

require 'minitest/autorun'
require 'parameterised/paths'

class ParameterisedPathsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil Parameterised::Paths::VERSION
  end

  def test_it_does_something_useful
    assert true
  end
end
