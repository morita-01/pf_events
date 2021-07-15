ActiveAdmin.register Event do
#
#イベント会場一覧の項目を出力する
  index do
    #チェックボックス
    selectable_column
    # colnumn :idと同じ
    id_column
    column :eventname
    column :address
    column :siteurl
    column :comment
    #actionsには詳細、編集、削除ボタン機能
    actions
  end
#イベント会場詳細の項目を出力
  show do |object|
    attributes_table do
      row :image do
        attachment_image_tag object, :image, :fill, 200,200, fallback: "no_image.jpg" 
      end
      row :eventname
      row :address
      row :siteurl
      row :comment
    end
  end
#イベント会場の作成・編集項目を出力
  form do |f|
    f.inputs do
      f.input :image
      f.input :eventname
      f.input :address
      f.input :siteurl
      f.input :comment
    end
    f.actions
  end
end