class StripePurchasesController < ApplicationController
  before_action :set_stripe_purchase, only: %i[ show edit update destroy ]

  # GET /stripe_purchases or /stripe_purchases.json
  def index
    @stripe_purchases = StripePurchase.all
  end

  # GET /stripe_purchases/1 or /stripe_purchases/1.json
  def show
  end

  # GET /stripe_purchases/new
  def new
    @stripe_purchase = StripePurchase.new
  end

  # GET /stripe_purchases/1/edit
  def edit
  end

  # POST /stripe_purchases or /stripe_purchases.json
  def create
    @stripe_purchase = StripePurchase.new(stripe_purchase_params)

    respond_to do |format|
      if @stripe_purchase.save
        StripeItemService.incrememnt_item_sale()
        StripePurchaseJob.perform_async(purchase_id: @stripe_purchase.id)
        format.html { redirect_to @stripe_purchase, notice: "Stripe purchase was successfully created." }
        format.json { render :show, status: :created, location: @stripe_purchase }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @stripe_purchase.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /stripe_purchases/1 or /stripe_purchases/1.json
  def update
    respond_to do |format|
      if @stripe_purchase.update(stripe_purchase_params)
        format.html { redirect_to @stripe_purchase, notice: "Stripe purchase was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @stripe_purchase }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @stripe_purchase.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /stripe_purchases/1 or /stripe_purchases/1.json
  def destroy
    @stripe_purchase.destroy!

    respond_to do |format|
      format.html { redirect_to stripe_purchases_path, notice: "Stripe purchase was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stripe_purchase
      @stripe_purchase = StripePurchase.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def stripe_purchase_params
      params.fetch(:stripe_purchase, {})
    end
end
