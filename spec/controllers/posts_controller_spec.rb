describe PostsController, type: :request do
  context "when a user is not authenticated" do
    describe "#index" do
      it "allows users to see posts" do
        get posts_path
        expect(response.status).to eq(200)
      end
    end

    describe "#show" do
      it "allows users to see an individual post" do
        post = create(:post)
        get post_path(post)
        expect(response.status).to eq(200)
      end
    end

    describe "#new" do
      it "redirects unauthenticated users" do
        get new_post_path
        expect(response.status).to eq(302)
      end
    end

    describe "#create" do
      it "denies unauthenticated users" do
        post posts_path, xhr: true
        expect(response.status).to eq(401)
      end
    end

    describe "#edit" do
      it "redirects unauthenticated users" do
        post = create(:post)
        get edit_post_path(post)
        expect(response.status).to eq(302)
      end
    end

    describe "#update" do
      it "redirects unauthenticated users" do
        post = create(:post)
        patch post_path(post), xhr: true
        expect(response.status).to eq(401)
      end
    end

    describe "#destroy" do
      it "redirects unauthenticated users" do
        post = create(:post)
        delete post_path(post)
        expect(response.status).to eq(302)
      end
    end
  end

  context "when user is authenticated" do
    before(:each) do
      user = create(:user)
      login_as(user)
    end

    describe "#new" do
      it "succeeds" do
        get new_post_path
        expect(response.status).to eq(200)
      end
    end

    describe "#create" do
      it "creates a new post" do
        attributes = build(:post).attributes
        post posts_path, params: { post: attributes, format: :js }
        expect(Post.count).to eq(1)
      end
    end

    describe "#edit" do
      it "succeeds" do
        post = create(:post)
        get edit_post_path(post)
        expect(response.status).to eq(200)
      end
    end

    describe "#update" do
      it "will update a post" do
        post = create(:post)
        new_title = Faker::Beer.name
        patch post_path(post), params: { post: { title: new_title }, format: :js }
        post = Post.find_by_id(post.id)
        expect(post.title).to eq(new_title)
      end
    end

    describe "#destroy" do
      it "destroys a post" do
        post = create(:post)
        delete post_path(post)
        expect(Post.count).to eq(0)
      end
    end
  end
end
