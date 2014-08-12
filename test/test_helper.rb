ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def assert_not_validate(record, attrs)
    assert_not record.valid?, 'No validate failed'
    messages = record.errors.messages
    assert_same attrs.size, messages.size, "Message size not match, got #{messages}"
    attrs.each_pair do |k, v|
      message = messages[k]
      assert_not_nil message
      assert_match v,  message.first
    end
  end
end
