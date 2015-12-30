# -*- encoding : utf-8 -*-
class AddCategoryForPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :attachable_type, :string
    add_column :pages, :attachable_id, :integer
    add_column :pages, :category, :string
  end

  def self.down
    remove_column :pages, :attachable_id
    remove_column :pages, :attachable_type
    remove_column :pages, :category
  end
end
