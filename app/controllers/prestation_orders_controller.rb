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

  # GET /prestation_orders/new/step:step_number
  def new

    current_step_session = session[:prestation_order_step] || 1
    if params[:step_number] != current_step_session.to_s
      redirect_to action: :new, step_number: current_step_session.to_s
    end

    session[:prestation_order_params] ||= {}
    @prestation_order = PrestationOrder.new(session[:prestation_order_params])
    @prestation_order.current_step = current_step_session
    @step_number = current_step_session.to_s

    logger.debug "1 error (before valid?) : #{@prestation_order.errors.full_messages}"

    #generate errors if redirected after post with errors
    if params[:has_error]
      @prestation_order.valid?
    end
    logger.debug "2 error (after valid?) : #{@prestation_order.errors.full_messages}"



  end

  # GET /prestation_orders/1/edit
  def edit
  end

  # POST /prestation_orders
  # POST /prestation_orders.json
  def create
    session[:prestation_order_params].deep_merge!(prestation_order_params) if prestation_order_params

    @prestation_order = PrestationOrder.new(session[:prestation_order_params])

    @prestation_order.current_step = session[:prestation_order_step] || 1

    if @prestation_order.first_step?
      session[:prestation_order_params][:typeofproduct] = params[:commit]
    end

    valid = true
    if params[:back_button]
      @prestation_order.previous_step
      session[:prestation_order_step] = @prestation_order.current_step
    elsif @prestation_order.valid?
      if @prestation_order.third_step?
        @prestation_order.save

      else
        @prestation_order.next_step
        session[:prestation_order_step] = @prestation_order.current_step
      end
    else
      valid = false
    end

    respond_to do |format|
      if @prestation_order.new_record?
        if valid
          format.html { redirect_to action: :new, step_number: @prestation_order.current_step }
        else
          format.html { redirect_to action: :new, step_number: @prestation_order.current_step, has_error: true }
          format.json { render json: @prestation_order.errors, status: :unprocessable_entity }
        end
      else
        #reset des informations car le formulaire a été enregistré (save)
        session[:prestation_order_step] = session[:prestation_order_params] = nil
        format.html { redirect_to @prestation_order, notice: 'Votre demande de prestation a été soumise avec succès. Nous vous contacterons dans les plus bref délais.' }
        format.json { render :show, status: :created, location: @prestation_order }
      end
    end


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
