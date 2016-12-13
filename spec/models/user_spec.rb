require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user, email: 'test@example.com') }

  it 'has a valid factory' do
  	expect(user).to be_valid
  end

  it 'is invalid without an email' do
  	user.email = nil
  	expect(user).not_to be_valid
  end

  it 'is invalid without an username' do
  	user.username = nil
  	expect(user).not_to be_valid
  end

	it 'is invalid without an firstname' do
  	user.firstname = nil
  	expect(user).not_to be_valid
  end

  it 'is invalid without an lastname' do
  	user.lastname = nil
  	expect(user).not_to be_valid
  end

  it 'is invalid with an ununique email' do
  	user.save
  	new_user = build(:user, email: 'test@example.com')
  	expect(new_user).not_to be_valid
  end
end