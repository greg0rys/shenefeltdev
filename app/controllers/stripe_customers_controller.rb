class StripeCustomersController < ApplicationController
  before_action :set_stripe_customer, only: %i[ show edit update destroy ]

  # GET /stripe_customers or /stripe_customers.json
  def index
    @stripe_customers = StripeCustomer.all
  end

  # GET /stripe_customers/1 or /stripe_customers/1.json
  def show
  end

  # GET /stripe_customers/new
  def new
    @stripe_customer = StripeCustomer.new
  end

  # GET /stripe_customers/1/edit
  def edit
  end

  # POST /stripe_customers or /stripe_customers.json
  def create
    @stripe_customer = StripeCustomer.new(stripe_customer_params)

    respond_to do |format|
      if @stripe_customer.save
        SyncCustomerToStripeJob.perform_later(customer_id: @stripe_customer.id)
        format.html { redirect_to @stripe_customer, notice: "Stripe customer was successfully created." }
        format.json { render :show, status: :created, location: @stripe_customer }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @stripe_customer.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /stripe_customers/1 or /stripe_customers/1.json
  def update
    respond_to do |format|
      if @stripe_customer.update(stripe_customer_params)
        format.html { redirect_to @stripe_customer, notice: "Stripe customer was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @stripe_customer }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @stripe_customer.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /stripe_customers/1 or /stripe_customers/1.json
  def destroy
    @stripe_customer.destroy!

    respond_to do |format|
      format.html { redirect_to stripe_customers_path, notice: "Stripe customer was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stripe_customer
      @stripe_customer = StripeCustomer.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def stripe_customer_params
      params.fetch(:stripe_customer, {})
    end
end
