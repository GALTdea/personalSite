class Blog < ApplicationRecord

  belongs_to :topic
  has_many :comments, dependent: :destroy

  # this allows us to crate a draft and
  enum status: {draft: 0, published: 1}

  extend FriendlyId
  friendly_id :title, use: :slugged


  validates_presence_of :title, :body


  def self.special_blogs
    all
  end


  def self.featured_blogs
    limit(2)
  end


  def self.recent
    order('created_at DESC')
  end

end
