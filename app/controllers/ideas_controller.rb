class IdeasController < ApplicationController

  #Nu kunnen niet ingelogde users alleen de ideas and reviews (index en show) zien, maar geen ideeen genereren
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :find_idea, only: [:show, :edit, :update, :destroy]

    def index
      @ideas = Idea.all
    end

    def show
      # @ideas = Idea.all
      @review = Review.new
    end

    def new
      @idea = Idea.new
    end

    def create
      @idea = Idea.new idea_params
      @idea.user = current_user
      if @idea.save
        redirect_to idea_path(@idea), notice: "Idea created successfully"
      else
        render :new
      end
    end

    def edit
      # @idea = Idea.find params[:id]
      unless can? :edit, @idea
        redirect_to @idea, alert: 'You can not edit an idea that is not yours'
      end
    end

    def update
      # @idea = Idea.find params[:id]
      if cannot? :edit, @idea
        redirect_to @idea
      elsif @idea.update idea_params
        redirect_to idea_path(@idea), notice: "Idea was successfully updated"
      else
        flash.now[:alert] = "Problem Updating"
        render :edit
      end
    end

    def destroy
      # @idea = Idea.find params[:id]
      if can? :destroy, @idea
        @idea.destroy
        redirect_to root_path, notice: 'Idea deleted'
      else
        redirect_to idea_path(@idea), alert: "You can not remove an idea that is not yours"
      end
    end

    private

    def idea_params
      params.require(:idea).permit(:title, :body)
    end

    def find_idea
      @idea = Idea.find params[:id]
    end

end
