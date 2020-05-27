require 'rails_helper'

RSpec.describe Calculation, type: :model do
  it { should belong_to :user }
end
