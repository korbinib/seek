class AddDoiToStudyhubResources < ActiveRecord::Migration[5.2]
  def change
    add_column :studyhub_resources, :doi, :string
  end
end
