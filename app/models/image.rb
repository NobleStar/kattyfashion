class Image < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  mount_uploader :image, ImageUploader

  belongs_to :portfolio, foreign_key: :portfolio_id
  # attr_accessible :image, :portfolio_id, :title, :description

  THUMB_WIDTH = 220

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.thumb.url,
      "delete_url" => admin_image_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end 
end
