class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :twitter_ids

  serialize :twitter_ids, Hash

  def twitter_timeline
    timeline = []
    self.twitter_ids.each do |key, value|
      begin
        timeline = timeline + Twitter.user_timeline(value) unless value.blank?
      rescue
      end
    end
    timeline.sort{ |a,b| b.created_at <=> a.created_at }
  end 
end
