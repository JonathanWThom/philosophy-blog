describe Book do
  it { should have_many :posts }
  it { should validate_presence_of :author }
  it { should validate_presence_of :description }
  it { should validate_presence_of :image_link }
  it { should validate_presence_of :title }
end
