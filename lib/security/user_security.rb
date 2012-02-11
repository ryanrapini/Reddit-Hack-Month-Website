require 'uuidtools'

include UUIDTools

module Security
  class UserSecurity
    def self.authenticate(username, password)
      user = User.find(:first, :conditions=>{:username=>username})
      return nil unless user
      return user if UserSecurity.check_password(user, password)
    end

    def self.check_password(user, password)
      user.password == self.get_password_hash(user, password)
    end

    def self.get_password_hash(user, password)
      password_salt = UserSecurity.get_password_salt(user)
      UUIDTools::UUID.md5_create(UUID_DNS_NAMESPACE, "#{password_salt}#{password}").to_s
    end

    def self.get_password_salt(user)
      pre_salt = pre_salt = user.created_at.to_time.to_i.to_s + user.email
      UUIDTools::UUID.md5_create(UUID_DNS_NAMESPACE, pre_salt).to_s
    end
  end
end
