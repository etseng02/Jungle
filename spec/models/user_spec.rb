require 'rails_helper'

describe User, type: :model do

  
  describe 'Validations' do
 
    subject { User.new(password: "test", password_confirmation: "test", name: "blah", email:"test@blah.com") }
    
    it "validates uniqueness of email" do
      User.create(password: "test", password_confirmation: "test", name: "blah", email:"test@blah.com")
      user = User.create(password: "test", password_confirmation: "test", name: "blah", email:"test@blah.com")
      expect(user.errors.full_messages).to include ("Email has already been taken")
    end

    it 'should have a password' do
      expect(subject.password).to be_present
    end
    
    it 'should have a password confirmation' do
      expect(subject.password_confirmation).to be_present
    end
    
    it 'should not pass if password does not match password confirmation' do
      subject.password_confirmation = "nottrue"
      expect(subject.password).not_to be == (subject.password_confirmation)
    end
    
    it 'should not pass if password is left blank' do
      user = User.create(name: "blah", email:"test@blah.com", password: nil)
      expect(user.errors.full_messages).to include ("Password is too short (minimum is 3 characters)")
    end
    
    it 'should not pass if password is too short' do
      user = User.create(password: "1", password_confirmation: "1", name: "blah", email:"test@blah.com")
      expect(user.errors.full_messages).to include ("Password is too short (minimum is 3 characters)")
    end



  end




end