class Article < ActiveRecord::Base
  include PolymorphicCommonInstance
  acts_as_common :resource
end
