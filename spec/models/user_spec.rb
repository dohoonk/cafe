require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validation" do
    it "requires first_name" do
      u = User.new
      u.valid?
      expect(u.errors).to have_key(:first_name)
    end
  end
end
