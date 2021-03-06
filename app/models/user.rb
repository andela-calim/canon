class User < ActiveRecord::Base
  has_many :comments
  has_many :votes
  rolify

  scope :unique_roles, ->(user) { where(id: user).joins(:roles).uniq.order('roles.name').pluck('roles.name') }

  def self.from_omniauth(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name: data["name"],
                           provider:access_token.provider,
                           email: data["email"],
                           uid: access_token.uid
        )
      end
    end
  end

end