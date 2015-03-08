class Pin < ActiveRecord::Base
	belongs_to :pinner
	belongs_to :board
	serialize :pinners, Array
end
