require 'rails_helper'

RSpec.describe BeanRecommendationEngine do
  let(:user) {FactoryGirl.create(:user)}
  let(:bean1) {FactoryGirl.create(:bean, sweet: 2, fruity: 2, bitter: 3, chocolate: 3)}
  let(:bean2) {FactoryGirl.create(:bean, sweet: 2, fruity: 1, bitter: 3, chocolate: 1)}
  let(:bean3) {FactoryGirl.create(:bean, sweet: 8, fruity: 5, bitter: 3, chocolate: 2)}

  let(:recipe1) {FactoryGirl.create(:recipe, sweet: 1, fruity: 3, bitter: 4, chocolate: 5)}
  let(:recipe2) {FactoryGirl.create(:recipe, sweet: 2, fruity: 5, bitter: 1, chocolate: 2)}
  let(:recipe3) {FactoryGirl.create(:recipe, sweet: 3, fruity: 1, bitter: 2, chocolate: 4)}

  before :each do
    allow(user).to receive(:like_beans) {[bean1, bean2, bean3]}
    allow(user).to receive(:like_recipes) {[recipe1, recipe2, recipe3]}
  end

  describe "setup_taste_profile" do
    it "should return a hash with aggregated bean values" do
      expect(BeanRecommendationEngine.new(user).setup_taste_profile).to eq({sweet: 3, fruity: 2, bitter: 2, chocolate: 2})
    end

  end

  describe "recommended_beans" do

    it "should only return beans that the user has not liked" do
      #expect(BeanRecommendationEngine.new(user).recommended_beans).to_not include(bean1, bean2, bean3)
    end

    it "should return to me recommended_beans" do
      #expect(BeanRecommendationEngine.new(user).recommended_beans).to eq()
    end

  end

end
