class FavoritesController < ApplicationController
  def update
    favorite = Favorite.where(post: Post.friendly.find_by(slug: params[:post]))
    if favorite.empty?
      Favorite.create(post: Post.friendly.find_by(slug: params[:post]), user: current_user)
      @favorite_exists = true
    else
      favorite.destroy_all
      @favorite_exists = false
    end

    respond_to do |format|
      format.js   # for AJAX/JS
      format.html { redirect_back fallback_location: post_path(params[:post]) }
    end
  end
end
