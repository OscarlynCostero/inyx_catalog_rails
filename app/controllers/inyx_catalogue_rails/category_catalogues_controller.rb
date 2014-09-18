require_dependency "inyx_catalogue_rails/application_controller"

module InyxCatalogueRails
  class CategoryCataloguesController < ApplicationController
    before_action :set_category_catalogue, only: [:show, :edit, :update, :destroy]
    layout :resolve_layout
    respond_to :json
    # GET /category_catalogues
    def index
      @category_catalogues = CategoryCatalogue.all
    end

    # GET /category_catalogues/1
    def show

    end

    # GET /category_catalogues/new
    def new
      @category_catalogue = CategoryCatalogue.new
    end

    # GET /category_catalogues/1/edit
    def edit
    end

    # POST /category_catalogues
    def create
      @category_catalogue = CategoryCatalogue.new(category_catalogue_params)

      if @category_catalogue.save
        redirect_to "/admin/category_catalogues", notice: 'Category catalogue was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /category_catalogues/1
    def update
      if @category_catalogue.update(category_catalogue_params)
        redirect_to @category_catalogue, notice: 'Category catalogue was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /category_catalogues/1
    def destroy
      @category_catalogue.destroy
      redirect_to category_catalogues_url, notice: 'Category catalogue was successfully destroyed.'
    end

    def all_category
      category_catalogue = CategoryCatalogue.all
      
      respond_to do |format|
        format.html
        format.json { render :json => category_catalogue.as_json }
      end
    end

    def one_category
      category_catalogue = CategoryCatalogue.find(params[:id])
      respond_to do |format|
        format.html
        format.json { render :json => category_catalogue.as_json }
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
      def set_category_catalogue
        @category_catalogue = CategoryCatalogue.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def category_catalogue_params
        params.require(:category_catalogue).permit(:title, :description)
      end
  end
end
