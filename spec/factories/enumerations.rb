# FactoryGirl.define do
#   factory :enumeration do |f|
#     f.name  'Sajjad'
#     f.type 'EmailType'
#     # f.name { 'Sajjad' }
#   end
# end

FactoryGirl.define do
  factory :enumeration do
    name 'Sajjad'
    type 'EmailType'
    value 1
  end
end