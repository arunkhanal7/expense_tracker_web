class IdeasController < ApplicationController
    def index
        @ideas =Idea.all
        @positive_expense = Idea.where('amount > 0').sum(:amount)
        @negative_expense= Idea.where('amount < 0').sum(:amount)
        @total=@positive_expense+@negative_expense

    end
    def create
        @idea = Idea.create(idea_params)
        if @idea.valid?

        else

        end
        redirect_to root_path
    end
    def edit
        @idea = Idea.find(params[:id])
        
    end
    def update
        @idea = Idea.find(params[:id])
        if @idea.update(idea_params)
            redirect_to root_path
        else
            redirect_to edit_idea_path(params[:id])
    end
end

def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to root_path
end


    private

    def idea_params
      params.require(:idea).permit(:title, :amount, :date)
    end
end
