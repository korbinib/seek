class AddVersionToStudyhubResources < ActiveRecord::Migration[5.2]
  def change
    add_column :studyhub_resources, :version, :integer, default: 1
  end
end
