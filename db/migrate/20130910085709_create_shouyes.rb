# -*- encoding : utf-8 -*-
class CreateShouyes < ActiveRecord::Migration
  def self.up
    create_table :shouyes do |t|
      t.string :logo
      t.string :title
      t.string :phone
      t.text :lianxi
      t.string :block_1_tit
      t.text :block_1_cont
      t.string :block_2_pic_1
      t.string :block_2_pic_2
      t.string :block_2_tit
      t.text :block_2_cont
      t.string :block_2_link
      t.string :block_3_tit
      t.string :block_3_cont
      t.string :block_3_pic
      t.string :block_3_link
      t.string :block_4_tit
      t.string :block_4_1_pic
      t.string :block_4_1_tit
      t.text :block_4_1_cont
      t.string :block_4_1_link
      t.string :block_4_2_pic
      t.string :block_4_2_tit
      t.text :block_4_2_cont
      t.string :block_4_2_link
      t.string :block_4_3_pic
      t.string :block_4_3_tit
      t.text :block_4_3_cont
      t.string :block_4_3_link

      t.timestamps
    end
  end

  def self.down
    drop_table :shouyes
  end
end
