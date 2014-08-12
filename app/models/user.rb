class User < ActiveRecord::Base
  has_secure_password
  has_many :resources
  validates :account, presence: true, uniqueness: true
  validates_presence_of :password_confirmation, :on => :create

  def articles
    Article.joins("JOIN resources ON articles.id = resources.instance_id 
        AND resources.instance_type = 'Article' ").where('resources.user_id = ?', id).order('created_at DESC')
  end
end
