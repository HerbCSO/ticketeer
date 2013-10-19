ActiveAdmin.register Ticket do

  scope :all, :default => true
  scope :open do |tickets|
    tickets.where(:served_at => nil)
  end

  index do
    column :id
    column :created_at
    column :served_at
    column :user
    default_actions
  end

  controller do
    def permitted_params
      params.permit(:ticket => [:served_at])
    end
  end

  # /admin/tickets/:id/comments
  # Note: this ain't workin'... :/ - see http://www.activeadmin.info/docs/8-custom-actions.html
  member_action :comments do
    @ticket = Ticket.find(params[:id])

    # This will render app/views/admin/tickets/comments.html.erb
  end
end
