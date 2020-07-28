class AssortmentsController < ApplicationController
  before_action :set_assortment, only: [:show, :edit, :update, :destroy]
  include Tagger
  include Markdownable

  def index
    @assortments = Assortment.all
  end

  def show
    @no_markdown = no_markdown
  end

  def new
    @tags = policy_scope(Tag)
    @assortment = Assortment.new
  end

  def edit
  end

  def create
    @assortment = Assortment.new(assortment_params)
    @assortment.user = current_user
    @tags = find_or_create_tags(assortment_params, current_user.id)
    @assortment.tags = @tags

    respond_to do |format|
      if @assortment.save
        format.html { redirect_to @assortment, notice: 'Assortment was successfully created.' }
        format.json { render :show, status: :created, location: @assortment }
      else
        format.html { render :new }
        format.json { render json: @assortment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @assortment.update(assortment_params)
        format.html { redirect_to @assortment, notice: 'Assortment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assortment }
      else
        format.html { render :edit }
        format.json { render json: @assortment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assortment.destroy
    respond_to do |format|
      format.html { redirect_to assortments_url, notice: 'Assortment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assortment
      @assortment = Assortment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assortment_params
      params.require(:assortment).permit(:name, :tag_list)
    end
end
