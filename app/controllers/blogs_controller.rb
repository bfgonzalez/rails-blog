class BlogsController < ApplicationController
  # list all blogs
  def index
    @blogs = Blog.all.order(:id)
  end

  # display blog based on id
  def show
    @blog = Blog.find(params[:id])
  end

  # create new blog instance
  def new
    @blog = Blog.new
  end

  # edit blog
  def edit
    @blog = Blog.find(params[:id])
  end

  # add blog to database
  def create
    @blog = Blog.new(params.require(:blog).permit(:title, :text, :body, :text))

    if @blog.save
      redirect_to @blog, alert: "Blog created successfully"
    else
      redirect_to new_blog_path, alert: "Error creating blog"
    end
  end

  # edit existing blog in database
  def update
    @blog = Blog.find(params[:id])

    if @blog.update(params.require(:blog).permit(:title, :text, :body, :text))
      redirect_to @blog
    else
      render "Edit"
    end
  end

  # delete blog from database
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to blogs_path
  end
end
