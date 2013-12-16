class Rectangle < ActiveRecord::Base
  after_save :notify_rectangle_change

  def notify_rectangle_change
    connection.execute "NOTIFY #{channel}," + "'{" + '"rect":' + self.to_json + "}'"
  end

  private
  def channel
    "layer#{self.layer_id}"
  end
end
