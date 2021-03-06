ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    within @head do
      script :src => javascript_path('tickets.js'), :type => "text/javascript"
    end

    columns do
      column do
        panel "Recent Active Tickets" do
          ul do
            Ticket.recent(50).map do |ticket|
              li link_to("#{ticket.id} - #{ticket.user.name} (#{ticket.user.email})", admin_ticket_path(ticket))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Tickets served per day, last 30 days."
          # content_tag :div, "", id: "tickets_chart", data: {tickets: Ticket.chart_data}
          logger.info Ticket.chart_data
          div id: "tickets_chart", "data-tickets" => Ticket.chart_data.to_json
        end
      end
    end
    # div do
    #   table_for Ticket.order('created_at desc').limit(5) do
    #     column :id
    #     column :created_at

    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
