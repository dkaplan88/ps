class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!,  only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.order('created_at DESC')
  end


  def new
    @post = Post.new
  end


  def edit
  end

  def create
    @post = Post.new(post_params)

    set_tags

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    set_tags

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.permit(:id, :title, :content, :slug, tags: [])
    end

    def set_tags
      tags = params["post"]["tags"]["name"]

      if tags
        tags.split(',').each do |tag|
          t = Tag.where(name: tag).first_or_create
          @post.tags << t
        end
      end
    end
end
