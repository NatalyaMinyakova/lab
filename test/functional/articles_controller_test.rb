require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = create :article
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    article_attrs = attributes_for :article

    post :create, article: article_attrs
    assert_response :redirect

    article = Article.find_by_title(article_attrs[:title])
    assert article_attrs[:title], article.title
  end

  test "should get edit" do
    get :edit, id: @article.id
    assert_response :success
  end

  test "should get show" do
    get :show, id: @article.id
    assert_response :success
  end

  test "should put update" do
    article_attrs = {}
    article_attrs[:title] = "OtherTitle"

    put :update, article: article_attrs, id: @article.id
    assert_response :redirect

    article = Article.find(@article.id)
    assert article_attrs[:title], article.title
  end

  test "should delete destroy" do
    delete :destroy, id: @article.id
    assert_response :redirect

    article = Article.find_by_id(@article.id)
    assert_nil article
  end
end
