require "administrate/field/base"

class ImageUploadField < Administrate::Field::Base
  def src
    data.to_s
  end
end
