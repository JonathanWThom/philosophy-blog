describe Sluggable do
  attr_reader :post

  before(:each) do
    @post = create(:post)
  end

  describe "#to_param" do
    it "returns the slug" do
      expect(post.to_param).to eq(post.slug)
    end
  end

  describe "#create_slug" do
    it "sets the slug to the parameterized title" do
      expect(post.slug).to eq(post.title.parameterize)
    end
  end

  describe ".find" do
    it "find the record by the slug" do
      expect(Post.find(post.slug)).to eq(post)
    end
  end
end
