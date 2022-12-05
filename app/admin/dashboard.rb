ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }
  content :title => proc{ I18n.t("active_admin.dashboard") } do

    panel "Users" do
      render 'admin/import/chart'
    end
  

  end
end
  # section "Chart", do
  #   div do
  #       render 'chart'
  #       end
  #   end
  # columns do
  #   column do
  #     panel "Top stuff --all name-removed for brevity--" do
  #       bar_chart User.group(:total_collect).order('total_collection DESC').limit(5)
  #     end
  #     end
  #   end 

