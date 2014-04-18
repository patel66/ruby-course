Module Timeline
	class CreateEvent < UseCase 
		def run(inputs)
			user_id = inputs[:user_id]
			team_id = inputs[:team_id]
			name = name[:name]

			return failure(:no_user_id) if user_id.nil?
			return failure(:no_team_id) if team_id.nil?
			return failure(:no_name) if name.nil?

			success :user_id => user_id, :team_id => team_id, :name => name
		end
	end 
end