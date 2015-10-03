require 'rails_helper'

RSpec.describe Bot, type: :model do
  it { should belong_to(:user) }
  it { should have_and_belong_to_many(:interactions) }


  it { should validate_presence_of :name}
  it { should validate_presence_of :gender}
  it { should validate_presence_of :eye_color}
  it { should validate_presence_of :hair_color}
  it { should validate_presence_of :age}
  it { should validate_numericality_of(:age) }
  it { should validate_numericality_of(:age).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:age).is_greater_than_or_equal_to(18) }
  it { should validate_presence_of :user_id }



  it { should have_valid(:age).when("34") }
  it { should_not have_valid(:age).when(nil, "", 12, 204) }
end
