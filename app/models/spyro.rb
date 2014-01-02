class Spyro < ActiveRecord::Base
  include SVG::Drawable

  after_save :notify_spyro_change
  after_destroy :notify_delete

  def notify_spyro_change
    self.class.connection.execute "NOTIFY #{channel},'{\"spyro\":#{self.id}}'"
  end

  # This functionality moved to the front end for now.
  # def generate(xOffset, yOffset, bigRadius, smallRadius, point)
  #   path = ""
  #   r1 = bigRadius
  #   r2 = smallRadius
  #   t = 0.0
  #   firstRun = true
  #   while t < 10*Math::PI do
  #     x = ((r1 - r2)*Math.cos(t) + point*Math.cos((r1 - r2)*t/r2)) + xOffset
  #     y = ((r1 - r2)*Math.sin(t) - point*Math.sin((r1 - r2)*t/r2)) + yOffset
  #     if firstRun
  #       path += "M#{x.round(5)} #{y.round(5)}"
  #       firstRun = false
  #       x1 = x
  #       y1 = y
  #     elsif x1 == x && y1 == y
  #       break
  #     else
  #       path += "L#{x.round(5)} #{y.round(5)}"
  #     end
  #     t += 0.002
  #   end
  #   self.path = path
  # end

end
