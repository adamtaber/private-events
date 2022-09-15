class RenameEventToAttendedEvent < ActiveRecord::Migration[7.0]
  def change
    rename_column :enrollments, :event_id, :attended_event_id
    rename_column :enrollments, :user_id, :attendee_id
  end
end
