class Board < ActiveRecord::Base
	belongs_to :pinner
	has_many :pins
end
