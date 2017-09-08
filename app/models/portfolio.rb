class Portfolio < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  has_many :technologies

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
    self.main_image ||= Placeholder.image_generator( '600' ,  '400')
    self.thumb_image ||= Placeholder.image_generator( '350' ,  '200')
  end
end


