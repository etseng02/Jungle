require 'rails_helper'

describe User, type: :model do

  
  describe 'Validations' do
 
    subject { User.new(password: "test", password_confirmation: "test", name: "blah", email:"test@blah.com") }
   
    it 'should have a name' do
      expect(subject.name).to be_present
    end

    it 'should have an email' do
      expect(subject.email).to be_present
    end

    it 'should have a password' do
      expect(subject.password).to be_present
    end
    
    it 'should have a password confirmation' do
      expect(subject.password_confirmation).to be_present
    end

  end #End of describe Validations

  describe '.authenticate_with_credentials' do

    #subject { User.new(password: "test", password_confirmation: "test", name: "blah", email:"test@blah.com") }

    it "validates uniqueness of email" do
      User.create(password: "test", password_confirmation: "test", name: "blah", email:"test@blah.com")
      user = User.create(password: "test", password_confirmation: "test", name: "blah", email:"test@blah.com")
      expect(user.errors.full_messages).to include ("Email has already been taken")
    end
    
    it 'should not pass if password does not match password confirmation' do
      user = User.create(password: "12345", password_confirmation: "12345", name: "blah", email:"test@blah.com")
      user_login = User.authenticate_with_credentials('test@blah.com', '67890')
      expect(user.errors.full_messages)
    end
    
    it 'should not pass if password is left blank' do
      user = User.create(name: "blah", email:"test@blah.com", password: nil)
      expect(user.errors.full_messages).to include ("Password is too short (minimum is 3 characters)")
    end
    
    it 'should not pass if password is too short' do
      user = User.create(password: "1", password_confirmation: "1", name: "blah", email:"test@blah.com")
      expect(user.errors.full_messages).to include ("Password is too short (minimum is 3 characters)")
    end

    it 'should pass if email is in a weird case' do
      user = User.create(password: "12345", password_confirmation: "12345", name: "blah", email:"test@blah.com")
      user_login = User.authenticate_with_credentials('TeST@blah.com', '12345')
      expect(user_login).to eql(user)
    end

    it 'should pass if email is in a weird case' do
      user = User.create(password: "12345", password_confirmation: "12345", name: "blah", email:"test@blah.com")
      user_login = User.authenticate_with_credentials(' test@blah.com', '12345')
      expect(user_login).to eql(user)
    end
    
   
  end #End of describe authenticate_with_credentials
end