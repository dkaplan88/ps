require 'spec_helper'

describe Post do
   it { should validate_presence_of(:content) }
   it { should validate_presence_of(:title) }
   it { validate_uniqueness_of(:title) }
   it { should have_and_belong_to_many(:tags) }
end
