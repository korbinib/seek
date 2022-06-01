class CreateProjectsStudyhubResourceVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :projects_studyhub_resource_versions do |t|
      t.references :version
      t.references :project
    end
  end
end
