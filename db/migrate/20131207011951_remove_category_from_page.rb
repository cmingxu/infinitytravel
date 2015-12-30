# -*- encoding : utf-8 -*-
class RemoveCategoryFromPage < ActiveRecord::Migration
  def self.down
    add_column :pages, :attachable_type, :string
    add_column :pages, :attachable_id, :integer
    add_column :pages, :category, :string
  end

  def self.up
    remove_column :pages, :attachable_id
    remove_column :pages, :attachable_type
    remove_column :pages, :category
  end
end
