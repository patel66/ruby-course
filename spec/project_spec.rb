require 'spec_helper'

describe 'Project' do
  before do
    @project = TM::Project.new("New Project")
    @project.add_task('ballout')
  end


  it "exists" do
    expect(TM::Project).to be_a(Class)
  end

  it 'has a name ' do
    expect(@project.name).to eq("New Project")
  end

  it 'initializes project with a unique id' do

    expect(@project.project_id).to eq(@project.object_id)
  end



  it 'created task with project id' do
     @p = TM::Project.new("P")
     @p.add_task('cool task')
      expect(@p.tasks[0].project_id).to eq(@p.project_id)
  end

  it 'marks the task completed when done' do

    expect(@project.tasks[0]).to receive(:task_id).and_return(1)

    expect(@project.complete_task(1)).to eq('complete')

  end

end

