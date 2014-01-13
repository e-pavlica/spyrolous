module SVG::Drawable

  # issues a notification in postgres for anyone listening on the channel 
  def notify_change
    self.class.connection.execute "NOTIFY #{channel}, '{\"#{self.class.to_s.downcase}\":#{self.to_json}}'"
  end

  def notify_delete
    self.class.connection.execute "NOTIFY #{channel}, '{\"destroy\":{\"#{self.class.to_s.downcase}\":#{self.id}}}'"
  end

  def svg_attributes
    "{
      fill:  \"#{self.fill}\",
      stroke: \"#{self.stroke}\",
      opacity: \"#{self.opacity}\",
      strokeWidth: \"#{self.stroke_width}\"
    }"
  end

  private
  def channel
    "layer#{self.layer_id}"
  end
end