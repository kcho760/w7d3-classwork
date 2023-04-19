require 'rails_helper'

RSpec.describe User, type: :model do
    let(:incomplete_user) {User.new(username:'', password: 'password')}

    it {should validates_presence_of(:username)}
    it {should validates_presence_of(:password_digest)}
    it {should validates_length_of(:password).is_at_least(6)}

    describe "::find_by_credentials" do
        before {user.save!}

        it "returns the user with the given username and password if they exist" do
            expect(User.find_by_credentials("merve@gmail.com", "password")).to eq(user)
        end

        it "returns nil if the username and password do not match any user" do
            expect(User.find_by_credentials("kevin@gmail.com", "passwrod")).to be nil
        end
        
    end
end