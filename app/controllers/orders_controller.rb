class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user, except: [:new, :create, :purchases]

  def purchases
    @orders = Order.all.where(user: current_user).order("created_at DESC")
  end

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @box = Box.find(params[:box_id])
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @box = Box.find(params[:box_id])
    @order.created_at = DateTime.now

    @order.box_id = @box.id
    @order.user_id = current_user.id
    @order.time = @order.created_at

    Stripe.api_key = ENV['STRIPE_API_KEY']
    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create(
        :amount => (@box.price * 100).floor,
        :currency => "eur",
        :card => token
        )
    rescue Stripe::CardError => e
      flash[:danger] = e.message
    end

    respond_to do |format|
      if @order.save
        OrderMailer.order_successful(@order).deliver
        format.html { redirect_to root_url, notice: 'Thanks for ordering!' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def check_user
      unless current_user.admin?
        redirect_to root_url, alert: "Sorry, only admins can do that!"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :city, :state, :province, :ZIP_code, :phone_number)
    end
end
