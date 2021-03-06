class ProjectsController < ApplicationController
  include Tagger
  include Markdownable
  include Draftable
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_draft, only: [:show, :edit, :update, :destroy]
  before_action :set_documents, only: [:show, :edit, :update, :destroy]

  def index
    @projects = policy_scope(Project).all
  end

  def show
    @no_markdown = no_markdown
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = create_project
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'project was successfully created.' }
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
        format.html { redirect_to @project, notice: 'project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def create_project
      @project = Project.new(project_params)
      @project.user = current_user
      @tags = find_or_create_tags(project_params, current_user.id)
      @project.tags = @tags
      authorize @project
      @project.save!
      
      @draft = Draft.create_draft(current_user, @project)

      return @project
    end

    def project_params
      params.require(:project).permit(:title, :tag_list)
    end
end
