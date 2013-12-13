class Circle < ActiveRecord::Base
  after_save :notify_circle_change

  def notify_circle_change
    connection.execute "NOTIFY #{channel}," +"'circle:"+self.to_json+"'"
  end

  private
  def channel
    "layer#{self.layer_id}"
  end
end

