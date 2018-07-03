class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    # intro page
  end

  def upload
  end

  def create
    post = Post.new
    post.category_id = 1
    post.user_id = current_user.id
    
    uploader = ImguploaderUploader.new

    # 첫번째 이미지 업로드
    uploader.store!(params[:img1])
    post.img_url_1 = uploader.url.gsub("/uploads", "")

    # 두번째 이미지 업로드
    uploader.store!(params[:img2])
    post.img_url_2 = uploader.url.gsub("/uploads", "")

    ## post 저장
    post.save

    # img 모델에 post_id와 img_url 저장
    img = Img.new
    img.post_id = post.id
    img.img_url = post.img_url_1.gsub("/uploads", "")
    img.save

    img = Img.new
    img.post_id = post.id
    img.img_url = post.img_url_2.gsub("/uploads", "")
    img.save

    redirect_to '/'
  end

  def delete
    post = Post.find(params[:post_id])
    post.destroy
    redirect_to '/'
  end

  # 사진 선택
  def selection
    @posts = Post.all.reverse
    @likes = React.all
    @imgs = Img.all
  end

  def goodphoto
    @imgs = Img.order(like_count: :desc)
  end

  def myprofile
    @posts = Post.all.reverse
    @imgs = Img.order(like_count: :desc)

    tempCount = 0
    @hot = nil
    @imgs.each do |i|
      if i.post.user_id == current_user.id
        if i.like_count > tempCount
          @hot = i.img_url
          tempCount = i.like_count
        end
      end
    end
  end
end
