class ReactsController < ApplicationController
  before_action :authenticate_user!
  def likes
    like = React.new
    like.user_id = current_user.id
    like.img_url = '/' + params[:img_url]
    like.post_id = params[:post_id]
    like.save

    img = Img.find_by(img_url: like.img_url)
    img.like_count += 1
    img.save

    redirect_to '/posts/selection'
  end

  def dislikes
    dislike = React.find_by(user_id: params[:user_id], post_id: params[:post_id])

    img = Img.find_by(img_url: dislike.img_url)
    img.like_count -= 1;
    img.save

    dislike.destroy
    redirect_to '/posts/selection'
  end
end
