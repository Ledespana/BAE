require 'rails_helper'

RSpec.describe Interaction, type: :model do
  it { should have_and_belong_to_many(:bots) }

  it { should validate_presence_of :category}
  it { should validate_presence_of :response}

end
