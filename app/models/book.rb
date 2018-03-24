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
end
