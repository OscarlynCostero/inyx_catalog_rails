require 'test_helper'

module InyxCatalogRails
  class AttachmentsControllerTest < ActionController::TestCase
    setup do
      @attachment = attachments(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:attachments)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create attachment" do
      assert_difference('Attachment.count') do
        post :create, attachment: { description: @attachment.description, image: @attachment.image, name: @attachment.name, type: @attachment.type, url: @attachment.url }
      end

      assert_redirected_to attachment_path(assigns(:attachment))
    end

    test "should show attachment" do
      get :show, id: @attachment
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @attachment
      assert_response :success
    end

    test "should update attachment" do
      patch :update, id: @attachment, attachment: { description: @attachment.description, image: @attachment.image, name: @attachment.name, type: @attachment.type, url: @attachment.url }
      assert_redirected_to attachment_path(assigns(:attachment))
    end

    test "should destroy attachment" do
      assert_difference('Attachment.count', -1) do
        delete :destroy, id: @attachment
      end

      assert_redirected_to attachments_path
    end
  end
end
