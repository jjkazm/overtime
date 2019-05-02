require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end
  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created with empty first_name and last_name" do
      @user.last_name = nil
      @user.first_name = nil
      expect(@user).not_to be_valid
    end
  end

  describe "custom name methods" do
    it "has full name that combines first and last name" do
      expect(@user.full_name).to eq("OGOREK, JUREK")
    end
  end
end
