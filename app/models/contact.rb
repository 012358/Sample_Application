class Contact < ActiveRecord::Base
  has_attached_file :photo, styles: { small: "150x150>", large: "300*300>" },
                    url: "/system/:attachment/:id/:style/:basename.:extension",
                    path: ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
                    processors: [:cropper]
  validates_attachment_presence :photo
  validates_attachment_size :photo, less_than: 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def photo_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(photo.path(style))
  end

  def reprocess_photo
    photo.reprocess!
  end

end
