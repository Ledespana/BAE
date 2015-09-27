require 'rails_helper'

RSpec.describe Interaction, type: :model do
  it { should belong_to(:bot) }

  it { should validate_presence_of :category}
  it { should validate_presence_of :response}
  it { should validate_presence_of :bot_id}


end
