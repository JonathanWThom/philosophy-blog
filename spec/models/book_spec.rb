describe Book do
  it { should have_many :posts }
  it { should validate_presence_of :author }
  it { should validate_presence_of :description }
  it { should validate_presence_of :image_link }
  it { should validate_presence_of :title }

  describe "image_link validations" do
    it "will not allow a non-image url" do
      url = "https://www.example.com"
      expect do
        create(:book, image_link: url)
      end.to raise_exception ActiveRecord::RecordInvalid
    end

    it "will not allow a non url image" do
      url = "image.jpg"
      expect do
        create(:book, image_link: url)
      end.to raise_exception ActiveRecord::RecordInvalid
    end

    it "will allow a url that is an image" do
      url = "https://www.example.com/image.jpg"
      expect do
        create(:book, image_link: url)
      end.to change { Book.count }.by 1
    end
  end
end
