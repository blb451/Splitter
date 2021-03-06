class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.jpg"].compact.join('_'))
  end

  version :mail do
    process resize_to_fill: [64, 64]
  end
  version :small do
    process resize_to_fill: [110, 110]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
