class Book < ActiveRecord::Base
  has_many :posts

  validates(
    :title,
    :author,
    :description,
    :image_link,
    presence: true
  )

  before_create :create_slug
  before_update :create_slug, if: :title_changed?

  def self.color_options
    colors = [
      "red",
      "orange",
      "yellow",
      "olive",
      "green",
      "teal",
      "blue",
      "violet",
      "purple",
      "pink",
      "brown",
      "grey",
      "black"
    ].sort

    colors.map do |color|
      [color.titleize, color]
    end
  end

  ## share this?
  def self.ordered
    order(created_at: :desc)
  end

  ## share these as well
  def to_param
    slug
  end

  def create_slug
    self.slug = self.title.parameterize
  end

  def self.find(input)
    find_by!(slug: input)
  end
end
