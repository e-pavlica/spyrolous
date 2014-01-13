class Layer < ActiveRecord::Base
  #include SVG::Drawable

  has_many :circles
  has_many :paths
  has_many :rectangles
  has_many :spyros
  #after_save :notify_change

  def listen
    self.class.connection.execute "LISTEN #{channel}"
  ensure 
    self.class.connection.execute "UNLISTEN #{channel}"
  end

  def on_change
    self.class.connection.execute "LISTEN #{channel}"
    self.class.connection.raw_connection.wait_for_notify do |event, pid, data|
      yield data
      break
    end
  ensure 
    self.class.connection.execute "UNLISTEN #{channel}"
  end

  private

  def channel
    "layer#{id}"
  end
end
