# frozen_string_literal: true

# == Schema Information
#
# Table name: spree_assets
#
#  id                      :integer          not null, primary key
#  viewable_type           :string(255)
#  viewable_id             :integer
#  attachment_width        :integer
#  attachment_height       :integer
#  attachment_file_size    :integer
#  position                :integer
#  attachment_content_type :string(255)
#  attachment_file_name    :string(255)
#  type                    :string(75)
#  attachment_updated_at   :datetime
#  alt                     :text(65535)
#  created_at              :datetime
#  updated_at              :datetime
#
# @override
# To make cloudinary work with paperclip as
# spree by default uses paperclip gem to upload images.
module Spree
  # Model Class: Image
  class Image < Asset
    validate :no_attachment_errors

    # Used Paperclip cloudinary to save images on cloudinay cdn
    # As earlier images was storing on host app public folder,
    has_attached_file :attachment,
                      styles: { mini: '48x48>', small: '100x100>', product: '240x240>', large: '600x600>' },
                      default_style: :product,
                      # cloudinary creds start
                      storage: 'cloudinary',
                      path: "#{GetTenantSubdomain.environment}/#{GetTenantSubdomain.subdomain}/products/:id/:style/:filename",
                      public_id:  "#{GetTenantSubdomain.environment}/#{GetTenantSubdomain.subdomain}/products",
                      # cloudinary creds ends
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

    validates_attachment :attachment,
                         presence: true,
                         content_type: { content_type: %w[image/jpeg image/jpg image/png image/gif] }

    # save the width, height of the original image (from which others can be calculated)
    # we need to look at the write-queue for images which have not been saved yet
    before_save :find_dimensions, if: :attachment_updated_at_changed?

    # used by admin products autocomplete
    def mini_url
      attachment.url(:mini, false)
    end

    def find_dimensions
      temporary = attachment.queued_for_write[:original]
      filename = temporary.path unless temporary.nil?
      filename = attachment.path if filename.blank?
      geometry = Paperclip::Geometry.from_file(filename)
      self.attachment_width  = geometry.width
      self.attachment_height = geometry.height
    end

    # if there are errors from the plugin, then add a more meaningful message
    def no_attachment_errors
      unless attachment.errors.empty?
        # uncomment this to get rid of the less-than-useful interim messages
        # errors.clear
        errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}' - check ImageMagick installation or image source file."
        false
      end
    end
  end
end
