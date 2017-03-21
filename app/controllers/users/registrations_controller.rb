class Users::RegistrationsController < Devise::RegistrationsController
  def build_resouce(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end
end
