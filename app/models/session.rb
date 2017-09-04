class Session < ApplicationRecord
	belongs_to :user
	belongs_to :test

	def name_state
		case state
		when 0
			"Preparing to start"
		when 1
			"Test is going on"
		when 2
			"Finished. Score: " + calculate_score.to_s + "%"
		end
	end
	def calculate_score
		sc = 0
		answers = (JSON.parse data)["answers"]
		test.questions.each_with_index do |q, i| 
			correct_ans = q.get_ans
			if answers[i].nil?
				break
			end
			user_ans = answers[i].split(',').map{|x| x.to_i}

	        if q.multi?

	          un = (correct_ans + user_ans).uniq
	          score = 0
	          un.each do |v|
	          if correct_ans.include? v and user_ans.include? v
	          		score+=1
	        	else
	          		score-=1

	          end
	      		end
	          if score < 0
	          	score = 0
	          end
	          if correct_ans.size == 0
	          	if user_ans.size == 0
	          		sc+=1
	          	end
	          else
				sc+= (score*1.0 ) / correct_ans.size
	          end
	        else
	    		if user_ans[0] == correct_ans[0]
	    			sc+=1
	    		end
	        end
	     end
	     return sc * 100.0 / test.questions.size
	end
end
