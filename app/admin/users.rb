ActiveAdmin.register User do
actions :all, except: [:edit, :update, :new]
permit_params :name, :email, :profile_image
#ユーザ一覧の項目を出力する
  index do
    #チェックボックス
    selectable_column
    # colnumn :idと同じ
    id_column
    column :name
    column :email
    #actionsには詳細、編集、削除ボタン機能
    actions
  end
  
  filter :name

#ユーザ詳細の項目を出力
  show do |object|
    attributes_table do
      row :profile_image do
        attachment_image_tag object, :profile_image, :fill, 200,200, fallback: "no_image.jpg" 
      end
      row :name
      row :email
    end
  end
  
  
  
  
#ユーザの作成・編集項目を出力
  form do |f|
    f.inputs do
      #refileの書き方
      f.attachment_field :profile_image
      f.input :name
      f.input :email
    end
    f.actions
  end


  #controller do
  # def create
  #  @event = Event.new(permitted_params[:event])
    #byebug
  #  @event.save!
  # end
  #end
  
end