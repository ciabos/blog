ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

     

     #Here is an example of a simple dashboard with columns and panels.
    
    columns do
       column do
         panel "Recent Comments" do
           ul do
             Comment.order("created_at DESC").limit(5).map do |comment|
               li link_to(comment.name + " commented on " + comment.post.title + comment.created_at.strftime(" %H:%M %m-%d-%Y"), admin_post_comment_path(comment.post, comment))
             end
           	end
         end
       end
    end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end  
end
