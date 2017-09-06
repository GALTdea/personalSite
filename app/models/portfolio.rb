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



  #call back
  # after the portolio item is instantiated in the new action
  after_initialize :set_defaults


  # the ||= operator allows us to only give the values if its nil, so when an update happens it will
  def set_defaults
    self.main_image ||= 'http://via.placeholder.com/600x400'
    self.thumb_image ||= 'http://via.placeholder.com/350x200'
  end
end


