class Book < ActiveRecord::Base
  include Orderable
  include Sluggable

  has_many :posts

  validates(
    :title,
    :author,
    :description,
    :image_link,
    presence: true
  )

  validates :image_link, format: { with: /\.(png|jpg)\Z/i }
  validates :image_link, format: { with: URI.regexp }

  def self.color_options
    colors = [
      "orange",
      "red",
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
end
