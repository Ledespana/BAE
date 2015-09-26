require 'rails_helper'

RSpec.describe Interaction, type: :model do
  it { should belong_to(:bot) }

  it { should validate_presence_of :keyword1}
  it { should validate_presence_of :response}
  it { should validate_presence_of :bot_id}


end
