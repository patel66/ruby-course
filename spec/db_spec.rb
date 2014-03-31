require 'spec_helper'

module TM

  describe "Database" do

    before do
      TM::Project.class_variable_set :@@project_id, 15

      @db = TM.db
      @proj = @db.add_project('project 1')

    end

    it 'exists' do
      expect(TM::Database).to be_a(Class)
    end

    it 'can add a project' do
      proj_id = @proj.project_id
      expect(@db.projects[proj_id].name).to eq(@proj.name)
    end

    it 'can get a project' do
      proj_id = @proj.project_id

      expect(@db.get_project(proj_id).name).to eq(@proj.name)
    end

    it 'can add a task' do
      task = @db.create_task(@proj.project_id, 'just do it')
      task2 = @db.create_task(@proj.project_id, 'do it')


      # expect(@db.tasks[1].task_id).to eq(task.task_id)
      expect(@db.get_task(1).description).to eq('just do it')
      expect(@db.tasks[2] .task_id).to eq(task2.task_id)
    end

    it 'can mark a task completed' do
      task1 = @db.create_task(@proj.project_id, 'just do it')
      task2 = @db.create_task(@proj.project_id, 'just do it2')
      task3 = @db.create_task(@proj.project_id, 'just do it3')

      @db.mark_complete(task1.task_id)
      expect(task1.status).to eq('complete')
    end

    it 'can get completed tasks' do
      task1 = @db.create_task(@proj.project_id, 'just do it')
      task2 = @db.create_task(@proj.project_id, 'just do it2')
      task3 = @db.create_task(@proj.project_id, 'just do it3')

      @db.mark_complete(task1.task_id )
      @db.mark_complete(task2.task_id )

      completed = @db.get_completed(@proj.project_id)
      completed_ids = completed.map {|t| t.task_id}
      # completed_ids = completed.map(&:id)
      expect(completed_ids).to include(task1.task_id)
      expect(completed_ids).to_not include(task3.task_id)
    end

    it 'it can get incomplete task' do
      task1 = @db.create_task(@proj.project_id, 'just do it')
      task2 = @db.create_task(@proj.project_id, 'just do it2')
      task3 = @db.create_task(@proj.project_id, 'just do it3')

      @db.mark_complete( task1.task_id )
      @db.mark_complete(  task2.task_id )

      incomplete = @db.get_incompleted(@proj.project_id)
      incompleted_ids = incomplete.map {|t| t.task_id}

      expect(incompleted_ids).to include(task3.task_id)
      expect(incompleted_ids).to_not include(task2.task_id)
    end

    it 'can add a employee' do

      task1 = @db.create_task(@proj.project_id, 'just do it')
      task2 = @db.create_task(@proj.project_id, 'just do it2')

      emp = @db.add_employee('bob', task1.task_id)
      eid = emp.employee_id

      expect(@db.get_employee(eid).name).to eq('bob')
      expect(task1.employee).to eq(1)
    end

    it 'can assign a employee to a project' do

      task1 = @db.create_task(@proj.project_id, 'just do it')
      emp = @db.add_employee('bob', task1.task_id)
      eid = emp.employee_id

      mem = @db.assign_membership(eid, @proj.project_id)

      expect(@db.membership.length).to be(1)


    end


  end


end
