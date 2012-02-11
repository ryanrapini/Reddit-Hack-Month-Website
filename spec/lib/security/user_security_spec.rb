require 'spec_helper'
require 'security/user_security'
require 'uuidtools'

include Security
include UUIDTools

describe UserSecurity do
  context "authenticate" do
    it "searches for valid user" do
      User.should_receive(:find).with do |*args|
       args[0].should == :first
       args[1].should == { :conditions => { :username=>'phil' } }
      end

      UserSecurity.authenticate('phil', 'meaningless')
    end

    it "requires a valid user match" do      
      User.stub(:find) { nil }
      UserSecurity.authenticate('username', 'password').should == nil
    end

    it "verifies a user's password" do
      user = User.new
      password = 'password'

      User.stub(:find) { user }
      UserSecurity.should_receive(:check_password).with do |*args|
       args[0].should == user
       args[1].should == password
      end

      UserSecurity.authenticate('test', password)
    end
  end

  context "checking password" do
    it "gets hash for plaintext password" do
      user = User.new
      UserSecurity.should_receive(:get_password_hash).with(user, 'password')

      UserSecurity.check_password(user, 'password')
    end

    it "returns true if hashed password matches stored value" do
      user = User.new
      user.password = 'test'
      UserSecurity.stub(:get_password_hash) { 'test' }

      UserSecurity.check_password(user, 'test').should == true
    end

    it "returns false if hashed password does not match stored value" do
      user = User.new
      user.password = 'something else'
      UserSecurity.stub(:get_password_hash) { 'test' }
      
      UserSecurity.check_password(user, 'test').should == false
    end
  end

  context "getting password hash" do
    it "gets the password salt" do
      user = User.new
      UserSecurity.should_receive(:get_password_salt).with(user)

      UserSecurity.get_password_hash(user, 'not important')
    end

    it "checks that plaintext password and user salt combination match stored hash" do
      plaintext_password = 'test'
      password_salt = '12345'
      password = UUIDTools::UUID.md5_create(UUID_DNS_NAMESPACE, "#{password_salt}#{plaintext_password}").to_s

      UserSecurity.stub(:get_password_salt) { '12345' }
      
      UserSecurity.get_password_hash(User.new, plaintext_password).should == password
    end
  end

  context "getting password salt" do
    it "creates salt from user created_at timestamp and email" do
      user = User.new
      user.created_at = DateTime.now
      user.email = 'example@example.com'

      pre_salt = user.created_at.to_time.to_i.to_s + user.email
      password_salt = UUIDTools::UUID.md5_create(UUID_DNS_NAMESPACE, pre_salt).to_s

      UserSecurity.get_password_salt(user).should == password_salt
    end
  end
end
