require 'rails_helper'
#
# RSpec.describe Enumeration, type: :model do
#
#   describe 'enumeration' do
#       @enumeration = FactoryGirl.create(name: 'first', type: 'EmailType', value: 1)
#     it 'should pass' do
#       expect(@enumeration.name).to eq('Sajjad')
#     end
#   end
# end


RSpec.describe Enumeration do
  let(:enumeration) { FactoryGirl.create(:enumeration) }

  p '++++++++++++++++'
  
  p '++++++++++++++++'
  it "has a valid factory" do
    enumeration.should be_valid
  end

  it "is invalid without a name" do
    # p FactoryGirl.build(:enumeration, name: nil).inspect
    FactoryGirl.build(:enumeration, name: nil).should_not be_valid
  end

  it "is valid with a name" do
    FactoryGirl.build(:enumeration).should be_valid
    # puts FactoryGirl.build(:enumeration).name
  end

  it 'should pass' do
    expect(FactoryGirl.build(:enumeration).type).to eq('Sajjad')
  end

end

# describe "admin?" do
#   puts "Sajjad"
#
#   it "should be detectable" do
#     puts "Salman"
#   end
#
# end