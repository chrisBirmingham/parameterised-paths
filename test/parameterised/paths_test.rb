# frozen_string_literal: true

require 'minitest/autorun'
require 'parameterised/paths'

class ParameterisedPathsTest < Minitest::Test
  def test_simple_path_match
    path = Parameterised::Paths::Path.new('/simple/path')
    match = path.match('/simple/path')

    refute_nil match
    assert_equal 0, match.params.count
  end

  def test_simple_path_no_match
    path = Parameterised::Paths::Path.new('/simple/path')
    match = path.match('/simple/paaaaath')

    assert_nil match
  end

  def test_single_parameter_match
    path = Parameterised::Paths::Path.new('/simple/:path')
    match = path.match('/simple/match')

    refute_nil match
    assert_equal 1, match.params.count
    assert_equal 'match', match.params['path']
  end

  def test_single_parameter_no_match
    path = Parameterised::Paths::Path.new('/simple/:path')
    match = path.match('/simple/paaaaath/path')

    assert_nil match
  end

  def test_multiple_parameters
    path = Parameterised::Paths::Path.new('/simple/:path/:path2')
    match = path.match('/simple/match/match2')

    refute_nil match
    assert_equal 2, match.params.count
    assert_equal 'match', match.params['path']
    assert_equal 'match2', match.params['path2']
  end

  def test_partial_no_match
    path = Parameterised::Paths::Path.new('/simple/:path/path2')
    match = path.match('/simple/match/match2')

    assert_nil match
  end
end
