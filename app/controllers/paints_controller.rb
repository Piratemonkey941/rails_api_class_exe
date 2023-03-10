class PaintsController < ApplicationController
    before_action :set_paint, only: [:show, :update, :destroy]

    # GET /paints
    def index
      @paints = Paint.all
      render json: @paints
    end
  
    # GET /paints/1
    def show
      render json: @paint
    end
  
    # POST /paints
    def create
      @paint = Paint.new(paint_params)
  
      if @paint.save
        render json: @paint, status: :created, location: @paint
      else
        render json: @paint.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /paints/1
    def update
      if @paint.update(paint_params)
        render json: @paint
      else
        render json: @paint.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /paints/1
    def destroy
      @paint.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_paint
        @paint = Paint.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def paint_params
        params.require(:paint).permit(:name, :brand, :color)
      end
      
end
