ActiveAdmin.register Ticket do

  scope :all, :default => true
  scope :open do |tickets|
    tickets.where(:served_at => nil)
  end

  controller do
    def permitted_params
      params.permit(:ticket => [:served_at])
    end
  end

  # /admin/posts/:id/comments
  member_action :comments do
    @ticket = Ticket.find(params[:id])

    # This will render app/views/admin/posts/comments.html.erb
  end
end
