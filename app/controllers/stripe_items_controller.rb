class StripeItemsController < ApplicationController
  before_action :set_stripe_item, only: %i[ show edit update destroy ]
  UPDATE_TYPES = [
    'NAME',
    'DESCRIPTION',
    'PRICE'
    'METADATA'
  ].freeze 

  # GET /stripe_items or /stripe_items.json
  def index
    @stripe_items = StripeItem.all
  end

  # GET /stripe_items/1 or /stripe_items/1.json
  def show
  end

  # GET /stripe_items/new
  def new
    @stripe_item = StripeItem.new
  end

  # GET /stripe_items/1/edit
  def edit
  end

  # POST /stripe_items
  def create
    @stripe_item = StripeItem.new(stripe_item_params)

    respond_to do |format|
      if @stripe_item.save
        queue_item_create(item_id: @stripe_item.id)
        format.html { redirect_to @stripe_item, notice: "Stripe item was successfully created." }
        format.json { render :show, status: :created, location: @stripe_item }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @stripe_item.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /stripe_items/1
  def update
    respond_to do |format|
      if @stripe_item.update(stripe_item_params)
        format.html { redirect_to @stripe_item, notice: "Stripe item was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @stripe_item }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @stripe_item.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /stripe_items/1 or /stripe_items/1.json
  def destroy
    @stripe_item.destroy!

    respond_to do |format|
      format.html { redirect_to stripe_items_path, notice: "Stripe item was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stripe_item
      @stripe_item = StripeItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def stripe_item_params
      params.fetch(:stripe_item, {})
    end

    def queue_item_create(item_id:)
      SyncItemToStripeJob.perform_later(item_id: item_id)
    end

    def queue_item_update(stripe_id:, update_type:)
      return nil if !update_type.in?(UPDATE_TYPES)
      return nil if stripe_id.blank?
      
      UpdateStripeItemJob.perform_later(stripe_id: stripe_id, update_type: update_type)
    end
end
