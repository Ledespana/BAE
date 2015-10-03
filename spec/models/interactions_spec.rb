require 'rails_helper'

RSpec.describe Interaction, type: :model do
  it { should have_many(:bots_interactions) }
  it { should have_many(:bots).through(:bots_interactions) }

  it { should validate_presence_of :category}
  it { should validate_presence_of :response}

end
