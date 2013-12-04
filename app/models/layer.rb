class Layer < ActiveRecord::Base
  has_many :circles
  has_many :paths
  has_many :rectangles
end
