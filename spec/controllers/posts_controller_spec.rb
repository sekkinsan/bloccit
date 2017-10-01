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


#comment out tests for show, new, and edit until we write implementation later
  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
