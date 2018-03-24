describe DashboardController, type: :request do
  context "when a user is not authenticated" do
    describe "#index" do
      it "does not allow users to see posts" do
        get dashboard_path
        expect(response.status).to eq(302)
      end
    end
  end

  context "when user is authenticated" do
    before(:each) do
      user = create(:user)
      login_as(user)
    end

    describe "#index" do
      it "allows users to see posts" do
        get dashboard_path
        expect(response.status).to eq(200)
      end
    end
  end
end
