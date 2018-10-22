class ToysController < ApplicationController
  def index
    # /cats/:cat_id:/toys
    cat = Cat.find(params[:cat_id])
    render json: cat.toys
  end

  def show
    # /cats/:cat_id/toys/:id
    render json: Toy.find(params[:id])
  end

  def create
    # POST /toys
    toy = Toy.new(toy_params)

    if toy.save
      render json: toy
    else
      render json: toy.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    toy = Toy.find(params[:id])
    toy.destroy
    render json: toy
  end

  def update
    toy = Toy.find(params[:id])
    if toy.update(toy_params)
      render json: toy
    else
      render json: toy.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

    def toy_params
      params[:toy].permit(:cat_id, :name, :toytype)
    end
end
