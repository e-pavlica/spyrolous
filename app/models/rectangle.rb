class Rectangle < ActiveRecord::Base
  include SVG::Drawable

  after_save :notify_change
  after_destroy :notify_delete

end
