class Blog < ApplicationRecord
  # this allows us to crate a draft and
  enum status: {draft: 0, published: 1}

  extend FriendlyId
  friendly_id :title, use: :slugged
end
