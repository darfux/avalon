module PolymorphicCommonInstance
	module ClassMethods
		def acts_as_common(abstractor)
			self.class_exec do
				has_one abstractor, as: :instance, dependent: :destroy, validate: true
				#Set update_only to avoid the child being deleted
				#and cause the parent also being deleted through dependent: :destroy
				accepts_nested_attributes_for abstractor, update_only: true	
				after_initialize :set_default_abstractor
				klass = abstractor.to_s.classify.constantize
				klass.accessable_attributes.each do |name|
			  	# unless self.method_defined?(name)
			  	class_eval %Q{
						def #{name}!
			  			self.#{abstractor}.#{name}
			  		end
			  		def #{name}_=(value)
			  			self.#{abstractor}.#{name}=value
			  		end			  	
				  }
			    # end
			  end

			  class_eval %Q{
					def set_default_abstractor
		  			build_#{abstractor} unless self.#{abstractor}
		  		end			  	
			  }
			end
		end
	end
	
	module InstanceMethods
	end
	


	def self.included(receiver)
		receiver.extend         ClassMethods
		receiver.send :include, InstanceMethods
	end
end
# ActiveRecord::Base.send :include, ActsAsCommentable