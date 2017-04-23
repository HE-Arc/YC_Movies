class PrestationOrdersController < ApplicationController
  before_action :set_prestation_order, only: [:show, :edit, :update, :destroy]
  before_action :set_headers, only: [:index, :show, :new, :edit]


  # GET /prestation_orders/1
  # GET /prestation_orders/1.json
  def success
  end

  # GET /prestation_orders/new/step:step_number
  def new
    session[:max_step_reached] ||= 1
    current_step_session = session[:prestation_order_step] || 1

    if params[:step_number].to_i > session[:max_step_reached]
      redirect_to action: :new, step_number: session[:max_step_reached].to_s
    elsif params[:step_number].to_i < current_step_session
      session[:prestation_order_step] = params[:step_number].to_i
    end

    session[:prestation_order_params] ||= {}
    session[:prestation_order_params][:length] ||= Time.new(1993, 02, 24, 0, 0, 0)
    @prestation_order = PrestationOrder.new(session[:prestation_order_params])
    @prestation_order.current_step = params[:step_number].to_i


    #generate errors if redirected from 'create' (POST) with errors
    if params[:has_error]
      @prestation_order.valid?
    end



  end


  # POST /prestation_orders
  # POST /prestation_orders.json
  def create

    session[:prestation_order_params].deep_merge!(prestation_order_params) if prestation_order_params
    session[:max_step_reached] = 1 unless session[:max_step_reached]

    @prestation_order = PrestationOrder.new(session[:prestation_order_params])
    @prestation_order.current_step = session[:prestation_order_step] || 1

    if @prestation_order.first_step?
      session[:prestation_order_params][:typeofproduct] = params[:commit]
    end

    valid = true
    captcha_success = false
    if params[:back_button]
      @prestation_order.previous_step
      session[:prestation_order_step] = @prestation_order.current_step
    elsif @prestation_order.valid?
      if @prestation_order.last_step?
	      if Captcha.first.activate == true
          if verify_recaptcha(model: @prestation_order) && @prestation_order.save
            captcha_success = true
          end
		    else
          if @prestation_order.save
            captcha_success = true
          end
		    end		
      else
        @prestation_order.next_step
        session[:prestation_order_step] = @prestation_order.current_step
        session[:max_step_reached] += 1
      end
    else
      valid = false
    end

    respond_to do |format|
      if @prestation_order.new_record?
        if valid
          p "YOLOOOOOO"
          format.html { redirect_to action: :new, step_number: @prestation_order.current_step }
        else
          format.html { redirect_to action: :new, step_number: @prestation_order.current_step, has_error: true }
          format.json { render json: @prestation_order.errors, status: :unprocessable_entity }
        end
      else
        if captcha_success
          #reset des informations car le formulaire a été enregistré (save)
          session[:prestation_order_step] = session[:prestation_order_params] = session[:max_step_reached] = nil
          format.html { redirect_to show_prestation_success_path, notice: 'Votre demande de prestation a été soumise avec succès. Nous vous contacterons dans les plus bref délais.' }
          format.json { render :show, status: :created, location: @prestation_order }
        else
          format.html { redirect_to action: :new, step_number: @prestation_order.current_step, has_error: true }
          format.json { render json: @prestation_order.errors, status: :unprocessable_entity }
        end
      end
    end


  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestation_order
      @prestation_order = PrestationOrder.find(params[:id])
    end

    # Set headers so that prestation pages can't be cached
    def set_headers
      response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate" # HTTP 1.1.
      response.headers["Pragma"] = "no-cache" # HTTP 1.0.
      response.headers["Expires"] = "0" # Proxies.
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prestation_order_params
      if params[:prestation_order]
        params.require(:prestation_order).permit(:name, :firstname, :entreprise, :email, :tel, :availabilities, :typeofproduct, :product, :length, :other, :interview)
      end
    end
end
