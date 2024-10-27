class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = "Wooo, you added a new kitten!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end
  def edit
    @kitten = Kitten.find(params[:id])
    flash[:success] = "Nice! Your kitten will now be ready to apply for new jobs!"
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update!(kitten_params)

    redirect_to @kitten
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:success] = "Awww, we're sorry to see it go! :("
    redirect_to root_url, status: :see_other
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
