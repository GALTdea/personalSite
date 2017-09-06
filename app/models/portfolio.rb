class Portfolio < ApplicationRecord

  validates_presence_of :title, :body, :main_image, :thumb_image

  #basic custome scope
  # 2 ways
  # 1.
  def self.angular
    where(subtitle: 'Angular')
  end

  # 2.
  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }
end
