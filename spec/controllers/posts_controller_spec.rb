require 'rails_helper'

RSpec.describe PostsController, type: :controller do

#create post an assign it to my_post using LET.
let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

#created a test for PostsController. type: :controller tells RSpec to treat test as Controller test
  describe "GET #index" do
    it "returns http success" do
#test performs GET on index view and expects response to be successful using have_http_status
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_post] to @posts" do
      get :index
  #expect index to return an array of one item, use assigns, a method in ActionController::TestCase
      expect(assigns(:posts)).to eq([my_post])
    end
  end

#when new is invoked, a new and unsaved Post object is created, per HTTP, GET requests shouldn't generate new data
#thus new (which is a GET) does not create data
  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

#expect PostsController#new to render the posts new view, using the render_Template method
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

#expect @post instance variable to be initialized by PostsController#new. assigns gives us access to the @post variable, assigning it to :post
    it "instantiates @post" do
      get :new
      expect(assigns(:post)).not_to be_nil
    end
  end

#when create is invoked, the newly created object is persisted to the database
  describe "POST create" do

#expect that after PostsController#create is called w/ parameters, the count of Post instances increases by 1
    it "increases the number of Post by 1" do
      expect{ post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Post,:count).by(1)
    end

#when create is POSTed to, expect newly created post to be assigned to @post
    it "assigns the new post to @post" do
      post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(assigns(:post)).to eq Post.last
    end

#expect to be redirected to the newly created post
    it "redirects to the new post" do
      post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(response).to redirect_to Post.last
    end
  end

  describe "GET show" do
    it "returns http success" do
#params hash contains all parameters passed to application's controller
      get :show, params: { id: my_post.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
#expect response to reutrn the show view using render_template matcher
      get :show, params: { id: my_post.id }
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, params: { id: my_post.id }
#expect post to equal my_post because we call show with the id of my_post, testing the post returned to us is the post we asked for
      expect(assigns(:post)).to eq(my_post)
    end
  end

#comment out tests for show, new, and edit until we write implementation later

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end


end
