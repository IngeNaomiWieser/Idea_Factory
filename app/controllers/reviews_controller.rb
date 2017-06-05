class ReviewsController < ApplicationController

  before_action :authenticate_user! # nu zouden niet ingelogde users geen reviews mogen creeren of deleten

  def create
    @idea = Idea.find params[:idea_id]
    review_params = params.require(:review).permit(:body)
    @review = Review.new review_params
    @review.idea = @idea
    if @review.save
      redirect_to idea_path(@idea), notice: "Review created!"
    else
      flash[:alert] = 'Problem creating review'
      render 'ideas/show'
    end
  end

  def destroy
    @idea = Idea.find params[:idea_id]
    @review = Review.find params[:id]
    @review.destroy
    redirect_to idea_path(@idea), notice: 'Your review was deleted'
  end

end
