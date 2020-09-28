class BlogsController < ApplicationController
  # list all blogs
  def index
    @blogs = Blog.all
  end

  # display blog based on id
  def show
    @blog = Blog.find(params[:id])
  end

  # create new blog instance
  def new
    @blog = Blog.new
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
end
