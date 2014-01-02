module SVG::Drawable

  # issues a notification in postgres for anyone listening on the channel 
  def notify_change
    self.class.connection.execute "NOTIFY #{channel}, '{\"#{self.class.to_s.downcase}\":#{self.to_json}}'"
  end

  def notify_delete
    self.class.connection.execute "NOTIFY #{channel}, '{\"destroy\":{\"#{self.class.to_s.downcase}\":#{self.id}}}'"
  end

  private
  def channel
    "layer#{self.layer_id}"
  end
end