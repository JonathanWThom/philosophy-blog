module Orderable
  extend ActiveSupport::Concern

  included do
    def self.ordered
      order(created_at: :desc)
    end
  end
end
