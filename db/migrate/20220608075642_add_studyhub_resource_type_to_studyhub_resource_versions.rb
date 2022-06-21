class AddStudyhubResourceTypeToStudyhubResourceVersions < ActiveRecord::Migration[5.2]
  def change
    add_reference :studyhub_resource_versions, :studyhub_resource_type
  end
end
