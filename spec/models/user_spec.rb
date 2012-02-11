require 'spec_helper'

describe User do
  context "authentication" do
    it "requires a username" do        
        User.authenticate(nil, 'test').should == nil
    end

    it "requires a password" do
        User.authenticate('user', nil).should == nil
    end

    it "requires a valid user" do
      User.authenticate('nonexistinguser', 'badpassword').should == nil
    end
  end
end
