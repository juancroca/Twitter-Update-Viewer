require 'test_helper'

class TwitterIdsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => TwitterId.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    TwitterId.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    TwitterId.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to twitter_id_url(assigns(:twitter_id))
  end

  def test_edit
    get :edit, :id => TwitterId.first
    assert_template 'edit'
  end

  def test_update_invalid
    TwitterId.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TwitterId.first
    assert_template 'edit'
  end

  def test_update_valid
    TwitterId.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TwitterId.first
    assert_redirected_to twitter_id_url(assigns(:twitter_id))
  end

  def test_destroy
    twitter_id = TwitterId.first
    delete :destroy, :id => twitter_id
    assert_redirected_to twitter_ids_url
    assert !TwitterId.exists?(twitter_id.id)
  end
end
