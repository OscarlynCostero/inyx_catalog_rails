require 'test_helper'

module InyxCatalogueRails
  class CategoryCataloguesControllerTest < ActionController::TestCase
    setup do
      @category_catalogue = category_catalogues(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:category_catalogues)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create category_catalogue" do
      assert_difference('CategoryCatalogue.count') do
        post :create, category_catalogue: { description: @category_catalogue.description, title: @category_catalogue.title }
      end

      assert_redirected_to category_catalogue_path(assigns(:category_catalogue))
    end

    test "should show category_catalogue" do
      get :show, id: @category_catalogue
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @category_catalogue
      assert_response :success
    end

    test "should update category_catalogue" do
      patch :update, id: @category_catalogue, category_catalogue: { description: @category_catalogue.description, title: @category_catalogue.title }
      assert_redirected_to category_catalogue_path(assigns(:category_catalogue))
    end

    test "should destroy category_catalogue" do
      assert_difference('CategoryCatalogue.count', -1) do
        delete :destroy, id: @category_catalogue
      end

      assert_redirected_to category_catalogues_path
    end
  end
end
