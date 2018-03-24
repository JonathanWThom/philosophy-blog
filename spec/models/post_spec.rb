describe Post do
  it { should belong_to :user }
  it { should belong_to :book }
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :book_id }
end
