class RequestsController < ApplicationController
  before_action :check_admin?,only: [:new,:create,:index]

  def new
    @lecturer = Lecture.find(params[:lecture_id])
    @subjects = Subject.all
    @request = Request.new
  end
  def show
    @requests = Request.where(client_id: current_user.id)
    if params[:subject].present?
      subject_id = Subject.find_by(title: params[:subject])&.id
      if subject_id
        @requests = @requests.where(subject_id: subject_id)
      end
    end

  end
  def index
    @requests = Request.all
  end
  def create
    @lecturer = Lecture.find(params[:lecture_id])
    @params = params.require(:request).permit(:lecture_start,:lecture_end)

    p ">>>>>>>>>>>>>>>>>>>"
    p @params[:lecture_start]

    @request = Request.new(
      request_code: rand(10000000000),
      date: @params[:lecture_start].to_s + " - " + @params[:lecture_end].to_s,
      client_id: current_user.id,
      subject_id: @lecturer.subject_id,
      lecturer_id: params[:lecture_id],
      lecture_start: @params[:lecture_start],
      lecture_end: @params[:lecture_end],
      actual_lecture_hours: @lecturer.lecture_start.to_s + @lecturer.lecture_end.to_s
    )
    if @request.save
      flash[:notice] = "request saved"
      redirect_to root_path
    end
  end

  def check_admin?
    unless current_user.admin?
      flash[:notice] = "admin user can not make request"
      redirect_to root_path
    end
  end
end
