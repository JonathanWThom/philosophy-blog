module Sluggable
  extend ActiveSupport::Concern

  included do
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
  end
end
