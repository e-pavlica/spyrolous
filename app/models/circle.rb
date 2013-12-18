class Circle < ActiveRecord::Base
  after_save :notify_circle_change
  after_destroy :notify_circle_delete

  def notify_circle_change
    connection.execute "NOTIFY #{channel},'{\"circle\":#{self.to_json}}'"
  end

  def notify_circle_delete
    connection.execute "NOTIFY #{channel}, '{\"destroy\":{\"circle\":#{self.id}}}'"
  end

  private
  def channel
    "layer#{self.layer_id}"
  end
end

