class CreateStudyhubResourceVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :studyhub_resource_versions do |t|
      t.string :title
      t.text :description
      t.integer :version

      t.references :contributor, :polymorphic => true, index: {:name => "index_studyhub_resource_versions_and_contributor_id"}
      t.string :uuid
      t.references :policy
      t.string :first_letter, :limit => 1
      t.timestamps
      t.datetime :last_used_at
      t.references :studyhub_resource
      t.string :doi
      t.text :revision_comments
      t.integer :visibility
    ends
  end
end