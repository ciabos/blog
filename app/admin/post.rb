ActiveAdmin.register Post do
  show do
    h1 post.title
    div do
      simple_format  post.body
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :category
      f.input :tag_list
    end
      f.inputs "Content" do
      f.input :body

      end
    f.actions
  end  
  
  action_item only: :show do
    link_to "Comments", admin_post_comments_path(post)
  end
  

  controller do
    def permitted_params
      params.permit( :post =>[ :title, :body, :category_id, :tag_list ])
    end
  end

end
