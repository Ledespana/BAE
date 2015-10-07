require "rails_helper"

RSpec.describe UsersInteraction, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:interaction) }
end
