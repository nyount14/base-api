module Tasks
    def self.new_task(params, current_user)
        # STEP 1 - create task
        task = current_user.tasks.new(params)
        # STEP 2 - save task
        # task.save!
        # STEP 3 - return errors if task not valid, otherwise step 4
        return ServiceContract.error("Error saving task") unless task.save
        # STEP 4 - return success
        ServiceContract.success(task)
    end

    def self.update_task(task_id, params)
        # STEP 1 - get the task we need to update with id
        task = Task.find(task_id)
        # STEP 2 - update
        # STEP 3 - return error if update was unsuccessful
        return ServiceContract.error("Task did not save successfully") unless task.update(params)
        # STEP 4 - return success if update was successful
        ServiceContract.success(task)
    end
end