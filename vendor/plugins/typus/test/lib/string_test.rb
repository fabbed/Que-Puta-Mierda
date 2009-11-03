require 'test/helper'

class StringTest < ActiveSupport::TestCase

  def test_should_return_post_actions_for_index
    assert_equal %w( cleanup ), 'Post'.typus_actions_for('index')
    assert_equal %w( cleanup ), 'Post'.typus_actions_for(:index)
  end

  def test_should_return_post_actions_for_edit
    assert_equal %w( send_as_newsletter preview ), 'Post'.typus_actions_for('edit')
    assert_equal %w( send_as_newsletter preview ), 'Post'.typus_actions_for(:edit)
  end

  def test_should_verify_typus_actions_for_unexisting_returns_is_empty
    assert 'TypusUser'.typus_actions_for('unexisting').empty?
    assert 'TypusUser'.typus_actions_for(:unexisting).empty?
  end

  def test_should_verify_typus_actions_for_index_returns_an_array
    assert 'Post'.typus_actions_for('index').kind_of?(Array)
    assert 'Post'.typus_actions_for(:index).kind_of?(Array)
  end

end