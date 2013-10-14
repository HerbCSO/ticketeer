ActiveAdmin.register Ticket do
  controller do
    def permitted_params
      params.permit(:ticket => [:served_at])
    end
  end
end
