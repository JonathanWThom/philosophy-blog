describe User do
  it { should have_many :posts }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :name }
end
