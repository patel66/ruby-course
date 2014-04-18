'require spec_helper'

describe 'create event' do
	before do 
		event = Timeline::Database::db.create_event(:name => 'Olympics', :team => 'USA', :user => 'Sam')
	end	
end


# describe Timeline::DB do
#   it "can create a event" do

#     db = Timeline::DB.new
#     db.create_project(...)

#   end
# end