class EnrollmentsController < ApplicationController
  def create
    #@enrollment = current_user.enrollments.build(enrollment_params)
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save!
      flash[:notice] = "You've been enrolled!"
      redirect_to event_path(Event.find(params[:id]))
    else
      redirect_to root_path
    end
  end

  def destroy
    @enrollment = Enrollment.find_by(attendee_id: current_user.id, attended_event_id: params[:id])
    @enrollment.destroy
    redirect_to event_path(Event.find(params[:id]))
  end
  
private

  def enrollment_params
    params.require(:enrollment).permit(:attendee_id, :attended_event_id)
  end
end
