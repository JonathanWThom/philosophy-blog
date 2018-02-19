class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, :body, presence: true
  before_create :create_slug
  before_update :create_slug, if: :title_changed?

  def to_param
    slug
  end

  def create_slug
    self.slug = self.title.parameterize
  end

  def self.find(input)
    find_by!(slug: input)
  end

  def self.ordered
    order(created_at: :desc)
  end

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
