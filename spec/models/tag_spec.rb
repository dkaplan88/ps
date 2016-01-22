require 'spec_helper'

describe Tag do
   it { should validate_presence_of(:name) }
   it { validate_uniqueness_of(:name) }
   it { should have_and_belong_to_many(:posts) }

   describe '#active' do
      it 'should not be active by default' do
        tag = Tag.new
        expect(tag.active?).to eq(false)
      end

      it 'should be active once associated with a post' do
        t = Tag.new(name: 'title', slug: 'title')
        p = Post.new(title: 'Title', content: 'content')
        p.tags = [t]
        p.save!
        expect(t.active?).to eq(true)
      end
   end
end
