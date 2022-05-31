class RemoveUnusedStudyhubResourceFields < ActiveRecord::Migration[5.2]
  def change
    remove_column :studyhub_resources, :study_id
    remove_column :studyhub_resources,:assay_id

    remove_column :studyhub_resources, :inclusion_studyhub
    remove_column :studyhub_resources,:inclusion_seek
    remove_column :studyhub_resources, :inclusion_mica

    remove_column :studyhub_resources, :exclusion_studyhub_reason
    remove_column :studyhub_resources,:exclusion_seek_reason
    remove_column :studyhub_resources, :exclusion_mica_reason

    remove_column :studyhub_resources, :data_source
    remove_column :studyhub_resources, :comment
    remove_column :studyhub_resources,:nfdi_person_in_charge
    remove_column :studyhub_resources, :contact_stage

  end
end
