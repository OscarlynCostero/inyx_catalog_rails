require_dependency "inyx_catalogue_rails/application_controller"

module InyxCatalogueRails
  class CataloguesController < ApplicationController
    before_action :set_catalogue, only: [:show, :edit, :update, :destroy]
    layout :resolve_layout
    respond_to :json

    # GET /catalogues
    def index
      @catalogues = Catalogue.all
    end

    # GET /catalogues/1
    def show
    end

    # GET /catalogues/new
    def new
      @catalogue = Catalogue.new
    end

    # GET /catalogues/1/edit
    def edit
    end

    # POST /catalogues
    def create
      @catalogue = Catalogue.new(catalogue_params)

      if @catalogue.save
        redirect_to @catalogue, notice: 'Catalogue was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /catalogues/1
    def update
      if @catalogue.update(catalogue_params)
        redirect_to @catalogue, notice: 'Catalogue was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /catalogues/1
    def destroy
      @catalogue.destroy
      redirect_to catalogues_url, notice: 'Catalogue was successfully destroyed.'
    end

    def index_front
      
    end

    def show_front
      
    end

    def resolve_layout
        case action_name
          when "show_front", "index_front"
            "application"
          else 
            "admin/application"
        end
      end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_catalogue
        @catalogue = Catalogue.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def catalogue_params
        params.require(:catalogue).permit(:image, :title, :description, :prince, :public, :category_catalogue_id)
      end
  end
end
