ActiveAdmin.register Category do

  form do |f|
    f.inputs "Name and description" do
      f.input :name
      f.input :description
    end
    f.actions
  end

  controller do 
    def permitted_params
      params.permit( :category =>[ :name, :description ])
    end
  end



end