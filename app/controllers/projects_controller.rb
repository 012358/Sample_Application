class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    if params[:q].blank?
      @projects = Project.includes(:tasks)
    else
      @projects = Project.search(params[:q]).records
      # @articles = Article.search params[:q]
    end
    @audits_projects=Project.all

    # if @projects.empty?
    #   Project.create(name: 'sm-sample-application', description: 'sm-sample-application.herokuapp.com')
    # end
    @projects
  end

  def show
  end

  def new
    @project = Project.new
    # @project.tasks.build
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path

  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :url, tasks_attributes: [:id, :description, :done, :_destroy],
                                      skills_attributes: [:id, :name, :_destroy])

    end
end
