require 'spec_helper'

describe PostsController do
  let(:valid_attributes) { { title: 'Test', content: 'example' } }

  before :each do
    sign_in
  end

  describe "GET index" do
    it "assigns all posts as @posts" do
      post = Post.create! valid_attributes
      get :index, {}
      assigns(:posts).should eq([post])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :show, {:id => post.to_param}
      assigns(:post).should eq(post)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new, {}
      assigns(:post).should be_a_new(Post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :edit, {:id => post.to_param}
      assigns(:post).should eq(post)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, valid_attributes
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, valid_attributes
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created post" do
        post :create, valid_attributes
        response.should redirect_to(Post.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post when no title" do
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => { title: ''  }}
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'new' template if no content" do
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => { content: '' }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested post" do
        post = Post.create! valid_attributes
        Post.any_instance.should_receive(:update).with({ "id" => "#{post.id}", "title" => "example" })
        put :update, {"id" => post.id, "title" => "example" }
      end

      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        put :update, {:id => post.id, :post => valid_attributes}
        assigns(:post).should eq(post)
      end

      it "redirects to the post" do
        post = Post.create! valid_attributes
        put :update, {:id => post.to_param, :post => valid_attributes}
        response.should redirect_to(post)
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        post = Post.create! valid_attributes
        Post.any_instance.stub(:save).and_return(false)
        put :update, {:id => post.to_param, :post => { title: '' }}
        assigns(:post).should eq(post)
      end

      it "re-renders the 'edit' template" do
        post = Post.create! valid_attributes
        Post.any_instance.stub(:save).and_return(false)
        put :update, {:id => post.to_param, :post => { content: '' }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, {:id => post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete :destroy, {:id => post.to_param}
      response.should redirect_to(posts_url)
    end
  end

end
