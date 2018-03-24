describe Sluggable do
  describe "#to_param" do
    it "returns the slug" do
      post = create(:post)
      expect(post.to_param).to eq(post.slug)
    end
  end

  describe "#create_slug" do
    it "sets the slug to the parameterized title" do
      post = create(:post)
      expect(post.slug).to eq(post.title.parameterize)
    end
  end

  describe ".find" do
    it "find the record by the slug" do
      post = create(:post)
      expect(Post.find(post.slug)).to eq(post)
    end
  end
end
