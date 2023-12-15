class LecturesController < ApplicationController
  before_action :set_lecture, only: %i[ show edit update destroy ]
  before_action :check_admin?,except: [:index,:show]
  # GET /lectures or /lectures.json
  def index
    @lectures = Lecture.all
  end

  # GET /lectures/1 or /lectures/1.json
  def show
    @current_lectures = Lecture.where(subject_id: params[:id])
  end

  # GET /lectures/new
  def new
    @lecture = Lecture.new
  end

  # GET /lectures/1/edit
  def edit
  end

  # POST /lectures or /lectures.json
  def create
    @lecture = Lecture.new(lecture_params)

    respond_to do |format|
      if @lecture.save
        format.html { redirect_to lecture_url(@lecture), notice: "Lecture was successfully created." }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lectures/1 or /lectures/1.json
  def update
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to lecture_url(@lecture), notice: "Lecture was successfully updated." }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1 or /lectures/1.json
  def destroy
    @lecture.destroy

    respond_to do |format|
      format.html { redirect_to lectures_url, notice: "Lecture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
        @lecture = Lecture.find_by(id: params[:id])
        unless @lecture
          flash[:notice] = "Lecture not found"
          redirect_to root_path # Redirect to the root path or an error page
        end

    end

    # Only allow a list of trusted parameters through.
    def lecture_params
      params.require(:lecture).permit(:title, :lecture_start, :lecture_end, :subject_id)
    end
  def check_admin?
    unless current_user.admin?
      flash[:notice] = "you need admin`s user"
      redirect_to root_path
    end
  end
end
