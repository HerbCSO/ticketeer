ActiveAdmin.register User do
  controller do
    def permitted_params
      params.permit(:user => [:name, :email, :admin, :servicer])
    end
  end

  index do
    column :id
    column :name
    column :email
    column :admin
    column :servicer
    default_actions
  end
end
