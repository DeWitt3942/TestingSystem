class Question < ApplicationRecord
	has_many :TQconnections
	has_many :tests, through: :TQconnections

	def get_ans
	    #q = JSON.parse (Question.find(question_id).data)
	    ans = []
	    (JSON.parse data).each_with_index do |o, i|
		    if (o["answer"])
	      	   	ans.push i
	    	end
		end
	    return ans
    end
end
