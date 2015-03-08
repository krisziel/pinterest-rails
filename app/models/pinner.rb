class Pinner < ActiveRecord::Base
	has_many :boards
	has_many :pins
end
