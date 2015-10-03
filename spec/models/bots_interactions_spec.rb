require "rails_helper"

RSpec.describe BotsInteraction, type: :model do
  it { should belong_to(:bot) }
  it { should belong_to(:interaction) }
end
