class Post < ActiveRecord::Base
  include Orderable
  include Sluggable

  belongs_to :user
  belongs_to :book, optional: true
  validates :title, :body, presence: true

  def self.grouped_by_month
    all.group_by { |post| post.created_at.beginning_of_month }
  end

  def author
    user.name
  end

  def date
    created_at.strftime("%B %e, %Y")
  end
end
