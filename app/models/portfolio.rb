class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies
  # this helper, allows us to create technology objects fromt he paretnt object, in this case is portfolio
  accepts_nested_attributes_for :technologies,
                                            # verifies that attribute name was filled
                                            reject_if: lambda { |attrs| attrs['name'].blank?}
                                            # reject_if: lambda { |attrs| attrs['name'].blank? }




  validates_presence_of :title, :body, :main_image, :thumb_image

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.by_position
    order("position ASC")
  end


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


