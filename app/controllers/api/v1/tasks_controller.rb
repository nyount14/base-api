module Api
    module V1
      class TasksController < Api::V1::ApplicationController
        # create 
        def create 
          # STEP 1 - get a result, result will be either failure or success 
          # create a task
          result = Tasks.new_task(task_params, @current_user)
          # STEP 2 - return a failure response depending on what result is 
          # render_error(errors: "Task was not saved successfully") and return unless result.success?
  
          # # STEP 3 - define a payload 
          # payload = {
          #   task: TaskBlueprint.render_as_hash(result.payload)
          # }
          # # STEP 4 - return a successful response with the payload
          # render_success(payload: payload)
        end
  
        # update 
  
        def update 
          # STEP 1 - get a result, result will be either failure or success 
          # create a task
          result = Tasks.update_task(params[:id], task_params)
          # STEP 2 - return a failure response depending on what result is 
          render_error(errors: "Task was not saved successfully") and return unless result.success?
  
          # STEP 3 - define a payload 
          payload = {
            task: TaskBlueprint.render_as_hash(result.payload)
          }
          # STEP 4 - return a successful response with the payload
          render_success(payload: payload)
        end
        
        # delete 
        def destroy 
          task = Task.find(params[:id])
          return render_error(error: "Error in deleting task") unless task.destroy
          render_success(payload: "Destroyed task!") 
        end
  
        # my tasks - current user tasks 
        def my_tasks 
          render_success(payload: TaskBlueprint.render_as_hash(@current_user.tasks))
        end
  
        private 
        def task_params 
          params.require(:task).permit(:task)
        end
      end
    end
  end