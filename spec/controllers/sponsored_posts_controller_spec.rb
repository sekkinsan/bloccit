require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do


    let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }

    let(:my_sponsored_post) { my_topic.sponsored_posts.create!( title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99) }


  #when new is invoked, a new and unsaved Post object is created, per HTTP, GET requests shouldn't generate new data
  #thus new (which is a GET) does not create data
    describe "GET new" do
      it "returns http success" do
        get :new, params: { topic_id: my_topic.id }
        expect(response).to have_http_status(:success)
      end

  #expect PostsController#new to render the posts new view, using the render_Template method
      it "renders the #new view" do
        get :new, params: { topic_id: my_topic.id }
        expect(response).to render_template :new
      end

  #expect @post instance variable to be initialized by PostsController#new. assigns gives us access to the @post variable, assigning it to my_sponsored_post
      it "instantiates @sponsored_post" do
        get :new, params: { topic_id: my_topic.id }
        expect(assigns(:sponsored_post)).not_to be_nil
      end
    end

  #when create is invoked, the newly created object is persisted to the database
    describe "POST create" do

  #expect that after PostsController#create is called w/ parameters, the count of Post instances increases by 1
      it "increases the number of sponsored post by 1" do
        expect{ post :create, params: { topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99 } } }.to change(SponsoredPost,:count).by(1)
      end

  #when create is POSTed to, expect newly created post to be assigned to @post
      it "assigns the new post to @sponsored_post" do
        post :create, params: { topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99 } }
        expect(assigns(:sponsored_post)).to eq SponsoredPost.last
      end

  #expect to be redirected to the newly created post
      it "redirects to the new post" do
        post :create, params: { topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99 } }
        expect(response).to redirect_to [my_topic, SponsoredPost.last]
      end
    end

    describe "GET show" do
      it "returns http success" do
  #params hash contains all parameters passed to application's controller
        get :show, params: { topic_id: my_topic.id, id: my_sponsored_post.id }
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
  #expect response to reutrn the show view using render_template matcher
        get :show, params: { topic_id: my_topic.id, id: my_sponsored_post.id }
        expect(response).to render_template :show
      end

      it "assigns my_sponsored_post to @sponsored_post" do
        get :show, params: { topic_id: my_topic.id, id: my_sponsored_post.id }
  #expect post to equal my_sponsored_post because we call show with the id of my_sponsored_post, testing the post returned to us is the post we asked for
        expect(assigns(:sponsored_post)).to eq(my_sponsored_post)
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, params: { topic_id: my_topic.id, id: my_sponsored_post.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, params: { topic_id: my_topic.id, id: my_sponsored_post.id }
    #expect edit view to render when a post is edited
        expect(response).to render_template :edit
      end

    #test that edit assigns the correct post to be updated to @post
      it "assigns post to be updated to @sponsored_post" do
        get :edit, params: { topic_id: my_topic.id, id: my_sponsored_post.id }

        sponsored_post_instance = assigns(:sponsored_post)

        expect(sponsored_post_instance.id).to eq my_sponsored_post.id
        expect(sponsored_post_instance.title).to eq my_sponsored_post.title
        expect(sponsored_post_instance.body).to eq my_sponsored_post.body
      end
    end

      describe "PUT update" do
        it "updates post with expected attributes" do
          new_title = RandomData.random_sentence
          new_body = RandomData.random_paragraph

          put :update, params: { topic_id: my_topic.id, id: my_sponsored_post.id, sponsored_post: {title: new_title, body: new_body } }
  #test that @post was updated with the title and body passed to update and that @post's id was not changed.
          updated_post = assigns(:sponsored_post)
          expect(updated_post.id).to eq my_sponsored_post.id
          expect(updated_post.title).to eq new_title
          expect(updated_post.body).to eq new_body
        end
  #expect to be redirected to the posts show view after the update.
        it "redirects to the updated sponsored post" do
          new_title = RandomData.random_sentence
          new_body = RandomData.random_paragraph

          put :update, params: { topic_id: my_topic.id, id: my_sponsored_post.id, sponsored_post: {title: new_title, body: new_body } }
          expect(response).to redirect_to [my_topic, my_sponsored_post]
        end
      end

      describe "DELETE destroy" do
        it "deletes the post" do
          delete :destroy, params: { topic_id: my_topic.id, id: my_sponsored_post.id }
    #search database for post with id my_sponsored_post.id, test asserts database won't have matching post after destroy is called.
          count = SponsoredPost.where({id: my_sponsored_post.id}).size
          expect(count).to eq 0
        end

        it "redirects to topic show" do
          delete :destroy, params: { topic_id: my_topic.id, id: my_sponsored_post.id }
          expect(response).to redirect_to my_topic
        end
      end

  end
