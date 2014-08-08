class Resource < ActiveRecord::Base
  include PolymorphicExtension
  belongs_to :instance, polymorphic: true
  belongs_to :user
  validates_presence_of :user

  set_accessable_attributes :user
end
