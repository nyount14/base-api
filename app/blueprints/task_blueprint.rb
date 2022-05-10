class TaskBlueprint < Blueprinter::Base 
    # id of book record
    identifier :id 
    # default values we want to pass 
    fields :task, :user_id
end