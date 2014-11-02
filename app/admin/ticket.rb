ActiveAdmin.register Ticket do

  scope :all, :default => true
  scope :open do |tickets|
    tickets.where(:served_at => nil)
  end

  index do
    # within @head do
    #   script :src => javascript_path('tickets.js'), :type => "text/javascript"
    # end
    # div id: "tickets_chart", "data-tickets" => Ticket.chart_data.to_json
    selectable_column
    column :id
    column :created_at
    column :served_at
    column :user
    column "Comments" do |ticket|
      ActiveAdmin::Comment.find_by(resource_type: ticket.class, resource_id: ticket.id.to_s).try(:body)
    end
    actions
  end

  controller do
    def permitted_params
      params.permit(:ticket => [:served_at])
    end
  end

end
