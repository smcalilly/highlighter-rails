class SourcesController < ApplicationController
	before_action :set_source, only: [:show, :destroy]

    def index
			@sources = policy_scope(Source)
		end
		
		def show
			@highlights = Highlight.where(source_id: @source)
		rescue
			redirect_to sources_path, notice: "that source doesn't exist"
		end

		def new
			@source = Source.new
		end

		def create
			@source = Source.new(source_params)
			@source.user = current_user
			authorize @source

    	respond_to do |format|
      	if @source.save
        	format.html { redirect_to @source, notice: 'Highlight was successfully created.' }
        	format.json { render :show, status: :created, location: @source }
      	else
        	format.html { render :new }
        	format.json { render json: @source.errors, status: :unprocessable_entity }
      	end
    	end
		end

		def destroy
			@source.destroy
	
			respond_to do |format|
				format.html { redirect_to sources_url, notice: 'Source was successfully destroyed.' }
				format.json { head :no_content }
			end
		end
	
		private
			def set_source
				@source = policy_scope(Source).find(params[:id])
			rescue
				redirect_to sources_path, notice: "that source doesn't exist."
			end
	
			def source_params
				params.require(:source).permit(:location, :title)
			end
end
