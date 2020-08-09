class DocumentsController < ApplicationController
	before_action :set_document, only: [:show, :edit, :update, :destroy]

    def index
			@documents = Document.all #policy_scope(Document)
		end
		
		def show
		end

		def new
			@document = Document.new
    end
    
    def edit
    end

		def create
			@document = Document.new(document_params)
			# @document.user = current_user
			# authorize @document

    	respond_to do |format|
      	if @document.save
        	format.html { redirect_to @document, notice: 'Document was successfully created.' }
        	# format.json { render :show, status: :created, location: @document }
      	else
        	format.html { render :new }
        	format.json { render json: @document.errors, status: :unprocessable_entity }
      	end
    	end
    end
    
    def update
      respond_to do |format|
        if @document.update(document_params)
          format.html { redirect_to @document, notice: 'document was successfully updated.' }
          format.json { render :show, status: :ok, location: @document }
        else
          format.html { render :edit }
          format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      end
    end

		def destroy
			@document.destroy
	
			respond_to do |format|
				format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
				format.json { head :no_content }
			end
		end
	
		private
			def set_document
				@document = Document.find(params[:id]) #policy_scope(Document).find(params[:id])
			rescue
				redirect_to documents_path, notice: "that document doesn't exist."
			end
	
			def document_params
				params.require(:document).permit(:title, :content)
			end
end
