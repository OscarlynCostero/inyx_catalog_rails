require_dependency "inyx_catalog_rails/application_controller"

module InyxCatalogRails
  class CatalogsController < ApplicationController
    before_action :set_catalog, only: [:show, :edit, :update, :destroy]
    layout :resolve_layout
    # GET /catalogs
    
    # GET /catalogs/1
    def show
    end

    # GET /catalogs/new
    def new
      @catalog = Catalog.new
    end

    # GET /catalogs/1/edit
    def edit
    end

    # POST /catalogs
    def create
      @catalog = Catalog.new(catalog_params)

      if @catalog.save
        redirect_to catalogs_path, notice: 'Catalog was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /catalogs/1
    def update
      if @catalog.update(catalog_params)
        redirect_to catalogs_path, notice: 'Catalog was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /catalogs/1
    def destroy
      @catalog.destroy
      redirect_to catalogs_url, notice: 'Catalogo ha sido borrado satisfactoriamente.'
    end

    def catalog_index
      @catalogs = Catalog.all
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_catalog
        @catalog = Catalog.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def catalog_params
        params.require(:catalog).permit(:name, :description, :cover, :category, :public)
      end

    def resolve_layout
      case action_name
        when "catalog_index"
          "frontend/application"
        else 
          "admin/application"
        end
      end
    end

  end

