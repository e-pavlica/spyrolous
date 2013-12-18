class Rectangle < ActiveRecord::Base
  after_save :notify_rectangle_change
  after_destroy :notify_rectangle_delete

  def notify_rectangle_change
    connection.execute "NOTIFY #{channel}, '{\"rect\":#{self.to_json}}'"
  end

  def notify_rectangle_delete
    connection.execute "NOTIFY #{channel}, '{\"destroy\":{\"rect\":#{self.id}}}'"
  end

  private
  def channel
    "layer#{self.layer_id}"
  end
end
