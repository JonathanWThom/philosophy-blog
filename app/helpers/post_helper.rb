module PostHelper
  def active_post(post)
    if params[:id] && post == Post.find(params[:id])
      "active"
    end
  end
end
