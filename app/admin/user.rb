ActiveAdmin.register User do

  scope :all, :default => true
  scope :admin do |users|
    users.where(:admin => true)
  end
  scope :servicer do |users|
    users.where(:servicer => true)
  end
  # scope :with_open_tickets do |users|
  #   users.where { Users.ticket.served_at == nil }
  # end

  controller do
    def permitted_params
      params.permit(:user => [:name, :email, :time_zone, :admin, :servicer])
    end
  end

  index do
    selectable_column
    column :id
    column :name
    column :email
    column :time_zone
    column :admin
    column :servicer
    actions
  end

end
