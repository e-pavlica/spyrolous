class Layer < ActiveRecord::Base
  has_many :circles
  has_many :paths
  has_many :rectangles
  has_many :spyros

  def on_change
    connection.execute "LISTEN #{channel}"
    loop do
      connection.raw_connection.wait_for_notify do |event, pid, data|
        yield data
      end
    end
  ensure 
    connection.execute "UNLISTEN #{channel}"
  end

  private

  def channel
    "layer#{id}"
  end
end
