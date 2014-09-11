require 'test_helper'

module InyxCatalogueRails
  class CataloguesControllerTest < ActionController::TestCase
    setup do
      @catalogue = catalogues(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:catalogues)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create catalogue" do
      assert_difference('Catalogue.count') do
        post :create, catalogue: { category_catalogue_id: @catalogue.category_catalogue_id, description: @catalogue.description, image: @catalogue.image, prince: @catalogue.prince, public: @catalogue.public, title: @catalogue.title }
      end

      assert_redirected_to catalogue_path(assigns(:catalogue))
    end

    test "should show catalogue" do
      get :show, id: @catalogue
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @catalogue
      assert_response :success
    end

    test "should update catalogue" do
      patch :update, id: @catalogue, catalogue: { category_catalogue_id: @catalogue.category_catalogue_id, description: @catalogue.description, image: @catalogue.image, prince: @catalogue.prince, public: @catalogue.public, title: @catalogue.title }
      assert_redirected_to catalogue_path(assigns(:catalogue))
    end

    test "should destroy catalogue" do
      assert_difference('Catalogue.count', -1) do
        delete :destroy, id: @catalogue
      end

      assert_redirected_to catalogues_path
    end
  end
end
