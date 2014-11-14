require_dependency "inyx_catalogue_rails/application_controller"

module InyxCatalogueRails
  class CataloguesController < ApplicationController
    before_action :set_catalogue, only: [:show, :edit, :update, :destroy]
    layout :resolve_layout
    respond_to :json

    # GET /catalogues
    def index

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
      authorize! :destroy, @catalogue, :message => 'Not authorized as an administrator.'
      catalogue = InyxCatalogueRails::Catalogue.find(params[:id])
      unless catalogue == current_user
        catalogue.destroy
        redirect_to "/admin/catalogues", :notice => t("notification.delete")
      else
        redirect_to "/admin/catalogues", :notice => t("notification.un_delete")
      end
    end

    def delete
      Catalogue.destroy( redefine_destroy params[:ids].split(",") )
      respond_to do |format|
        format.html { redirect_to messages_path, notice: 'Mensajes eliminados.' }
      end
    end

    

    def index_front
      @products = Catalogue.all
    end

    def show_front
      @product = Catalogue.find(params[:id])
    end

    def all_products      
      products = Catalogue.all
      products_json = products.as_json
      products.each_with_index do |item, index|
        category_catalogue = CategoryCatalogue.find(item.category_catalogue_id)
        products_json[index]["category"] = category_catalogue.as_json
      end
      respond_to do |format|
        format.html
        format.json { render :json => products_json }
      end
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

      def redefine_destroy(params)
        params.sort.each do |id|
          params.delete id unless Catalogue.exists? id
        end
      end

      # Only allow a trusted parameter "white list" through.
      def catalogue_params
        params.require(:catalogue).permit(:image, :title, :description, :prince, :public, :category_catalogue_id)
      end
  end
end
