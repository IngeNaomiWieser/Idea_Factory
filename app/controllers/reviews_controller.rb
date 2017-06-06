class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :update, :destroy] # nu zouden niet ingelogde users geen reviews mogen creeren of deleten

  def create
    @idea = Idea.find params[:idea_id]
    review_params = params.require(:review).permit(:body)
    @review = Review.new review_params
    @review.idea = @idea
    @review.user = current_user

    if @review.save
      redirect_to idea_path(@idea), notice: "Review created!"
    else
      flash[:alert] = 'Problem creating review'
      render 'ideas/show'
    end
  end

  def update
    @idea = Idea.find params[:idea_id]
    @review = Review.find params[:id]
    if can? :flag, @review
      if @review.is_flagged
        @review.is_flagged = false
      else
        @review.is_flagged = true
      end
      @review.save
      redirect_to @idea
    else
      redirect_to @idea, alert: "You can not flag this... "
    end
  end

  def destroy
    @idea = Idea.find params[:idea_id]
    @review = Review.find params[:id]
    if can? :destroy, @review
      @review.destroy
      redirect_to @idea, notice: 'Your review was deleted'
    else
      redirect_to @idea, alert: "You can not remove an review that is not yours."
    end
  end
end
