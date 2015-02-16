require_dependency "inyx_catalog_rails/application_controller"

module InyxCatalogRails
  class AttachmentsController < ApplicationController
    before_action :set_attachment, only: [:show, :edit, :update, :destroy]
    layout :resolve_layout
 
    def index      

      if params[:search].blank?
        @objects = Attachment.index(current_user, params[:catalog_id])
        @total_rows = @objects.count
        @objects = last_page(@objects, params[:currentPage].to_i) if @objects.count != 0
      else
        if(params[:direction]=="refresh")
          sleep(1)
        end
        items = Attachment.search(Attachment.query params[:search])
        @total_rows = Attachment.index_total items.records, current_user, params[:catalog_id]
        @objects = Attachment.index_search last_page_search(items, params[:currentPage].to_i).records, current_user, params[:catalog_id]
      end
      
      respond_to do |format|
        format.html { render action: 'index' }
        format.json { render :json => { objects: @objects, total_rows: @total_rows } }
      end
    end
    # GET /attachments/1
    def show
    end

    # GET /attachments/new
    def new
      @attachment = Attachment.new
    end

    # GET /attachments/1/edit
    def edit
    end

    # POST /attachments
    def create
      @attachment = Attachment.new(attachment_params)
      @attachment.catalog_id = params[:catalog_id]

      if @attachment.save
        redirect_to catalog_attachments_path, notice: 'Attachment was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /attachments/1
    def update
      if @attachment.update(attachment_params)
        @attachment.__elasticsearch__.index_document
        redirect_to catalog_attachments_path, notice: 'Attachment was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /attachments/1
    def destroy
      @attachment.destroy
      redirect_to catalog_attachments_path, notice: 'Attachment was successfully destroyed.'
    end

    def attachment_index
      @catalog = Catalog.find_by_id(params[:catalog_id]);
      @attachments = Attachment.where(:catalog_id=>params[:catalog_id])
    end

    def attachment_show
      @attachment = Attachment.find_by_id(params[:id])
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_attachment
        @attachment = Attachment.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def attachment_params
        params.require(:attachment).permit(:name, :upload, :description, :image, :url, :target, :public, :catalog_id)
      end

    def resolve_layout
      case action_name
        when "attachment_index", "attachment_show"
          "inyx_catalog_rails/frontend/application"
        else 
          "admin/application"
        end
      end
    
  end
end
