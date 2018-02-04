class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, :body, presence: true
  
  def self.ordered
    order(created_at: :desc)
  end

  def author
    user.name
  end

  def date
    created_at.strftime("%B %e, %Y")
  end
end
