class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|

      t.timestamps
      t.string     :name,                  null:false
      t.text       :description,           null:false
      t.integer    :category_id,           nul:false
      t.integer    :condition_id,          null:false
      t.integer    :shipping_fee_burden_id null:false
      t.integer    :shipping_origin_id     null:false
      t.integer    :shipping_duration_id   null:false
      t.integer    :price                  null:false
      t.references :user                   null:false, foreign_key: true
    end
  end
end
