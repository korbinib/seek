class AddResourceJsonToStudyhubResourceVersions < ActiveRecord::Migration[5.2]
  def change
    add_column :studyhub_resource_versions, :resource_json, :json
  end
end
