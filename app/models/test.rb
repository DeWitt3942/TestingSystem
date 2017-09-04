class Test < ApplicationRecord

	has_many :sessions
	has_many :TQconnections
	has_many :questions, through: :TQconnections
end
