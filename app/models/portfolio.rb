class Portfolio < ActiveRecord::Base
  include ApplicationHelper
  has_many :images, dependent: :destroy
  
  # attr_accessible :title, :description, :slug
  accepts_nested_attributes_for :images

  def title= title
    self[:title] = title
    self[:slug] = slugify title
  end
end
