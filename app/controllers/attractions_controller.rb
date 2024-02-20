class AttractionsController <ApplicationController
  layout 'application', except: [:show]
  def index
    @attractions = Attraction.all
  end

  def new
    #va a guardar una istancia nueva de tipo producto
    @attraction = Attraction.new
  end
  def create
    @attraction = Attraction.new(attraction_params)
    #pp es para mostrar por pantalla el contenido de una variable
    #pp @product

    if @attraction.save
      redirect_to attractions_path, notice: t('.created')
    else
      flash[:alert] = t('.alert')
      render :new, status: :unprocessable_entity
    end
  end
  def show
    #find es para buscar por el id
    #@product = Product.find(params[:id])
    attraction
    render layout: false
  end

  def edit
    #@product =  Product.find(params[:id])
    attraction
  end

  def update
    #@product =  Product.find(params[:id])
    if attraction.update(attraction_params)
      redirect_to attraction_path, notice: t('.updated')
    else
      render :edit, status:  :unprocessable_entity
    end
  end

  def destroy
    #@product =  Product.find(params[:id])
    attraction.destroy
    #redirect 302 a un código 303 ya que se elimino el producto
    redirect_to products_path,notice: t('.destroyed') ,status: :see_other
  end

  private

  def attraction_params
    params.require(:attraction).permit(:title, :description, :location)
  end
  def attraction
    @attraction =  Attraction.find(params[:id])
    #return @product
  end
end
