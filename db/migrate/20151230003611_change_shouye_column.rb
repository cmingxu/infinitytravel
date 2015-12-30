class ChangeShouyeColumn < ActiveRecord::Migration
  def change
    %w(logo title phone block_1_tit block_2_tit block_2_link block_3_tit block_3_cont block_3_link block_4_tit).each do |column|
      change_column :shouyes, column, :text
    end
  end
end
