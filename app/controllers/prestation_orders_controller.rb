class PrestationOrdersController < ApplicationController
  before_action :set_prestation_order, only: [:show, :edit, :update, :destroy]

  # GET /prestation_orders
  # GET /prestation_orders.json
  def index
    @prestation_orders = PrestationOrder.all
  end

  # GET /prestation_orders/1
  # GET /prestation_orders/1.json
  def show
  end

  # GET /prestation_orders/new
  def new

    session[:prestation_order_params] ||= {}
    @prestation_order = PrestationOrder.new(session[:prestation_order_params])
    @prestation_order.current_step = session[:prestation_order_step]
  end

  # GET /prestation_orders/1/edit
  def edit
  end

  # POST /prestation_orders
  # POST /prestation_orders.json
  def create
    session[:prestation_order_params].deep_merge!(prestation_order_params) if prestation_order_params

    @prestation_order = PrestationOrder.new(session[:prestation_order_params])

    @prestation_order.current_step = session[:prestation_order_step]

    if @prestation_order.first_step?
      @prestation_order.typeofproduct = params[:commit]
    end


    if params[:back_button]
      @prestation_order.previous_step
    elsif @prestation_order.valid?
      if @prestation_order.last_step?
        @prestation_order.save
      else
        @prestation_order.next_step
      end
    end


    session[:prestation_order_step] = @prestation_order.current_step

    if @prestation_order.new_record?
      render "new"
    else
      session[:prestation_order_step] = session[:prestation_order_params] = nil
      flash[:notice] = "Votre demande de prestation a été soumise avec succès. Nous vous contacterons dans les plus bref délais"
      redirect_to @prestation_order
    end

    #respond_to do |format|
    #  if @prestation_order.save
    #    format.html { redirect_to @prestation_order, notice: 'Prestation order was successfully created.' }
    #    format.json { render :show, status: :created, location: @prestation_order }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @prestation_order.errors, status: :unprocessable_entity }
    #  end
    #end


  end

  # PATCH/PUT /prestation_orders/1
  # PATCH/PUT /prestation_orders/1.json
  def update
    respond_to do |format|
      if @prestation_order.update(prestation_order_params)
        format.html { redirect_to @prestation_order, notice: 'Prestation order was successfully updated.' }
        format.json { render :show, status: :ok, location: @prestation_order }
      else
        format.html { render :edit }
        format.json { render json: @prestation_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prestation_orders/1
  # DELETE /prestation_orders/1.json
  def destroy
    @prestation_order.destroy
    respond_to do |format|
      format.html { redirect_to prestation_orders_url, notice: 'Prestation order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestation_order
      @prestation_order = PrestationOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prestation_order_params
      if params[:prestation_order]
        params.require(:prestation_order).permit(:name, :firstname, :entreprise, :email, :tel, :place, :availabilities, :typeofproduct, :product, :length, :interview, :month, :day, :other)
      end
    end
end
