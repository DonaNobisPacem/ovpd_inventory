class SupplyTransactionsController < ApplicationController
  before_action :set_supply_transaction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /supply_transactions
  # GET /supply_transactions.json
  def index
    @supply_transactions = SupplyTransaction.all
  end

  # GET /supply_transactions/1
  # GET /supply_transactions/1.json
  def show
    @user = User.find( @supply_transaction.user_id )
    @procurement = @supply_transaction.transaction_items.where( :transaction_type => 1 )
    @resupply = @supply_transaction.transaction_items.where( :transaction_type => 2 )
  end

  # GET /supply_transactions/new
  def new
    @supply_transaction = SupplyTransaction.new
    @supply_transaction.transaction_items.build
  end

  # GET /supply_transactions/1/edit
  def edit
  end

  # POST /supply_transactions
  # POST /supply_transactions.json
  def create
    @supply_transaction = SupplyTransaction.new(supply_transaction_params)

    respond_to do |format|
      if @supply_transaction.save
        format.html { redirect_to @supply_transaction, notice: 'Supply transaction was successfully created.' }
        format.json { render :show, status: :created, location: @supply_transaction }
      else
        format.html { render :new }
        format.json { render json: @supply_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supply_transactions/1
  # PATCH/PUT /supply_transactions/1.json
  def update
    respond_to do |format|
      if @supply_transaction.update(supply_transaction_params)
        format.html { redirect_to @supply_transaction, notice: 'Supply transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @supply_transaction }
      else
        format.html { render :edit }
        format.json { render json: @supply_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supply_transactions/1
  # DELETE /supply_transactions/1.json
  def destroy
    @supply_transaction.destroy
    respond_to do |format|
      format.html { redirect_to supply_transactions_url, notice: 'Supply transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supply_transaction
      @supply_transaction = SupplyTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supply_transaction_params
      params.require(:supply_transaction).permit(:user_id, :transaction_items_attributes => [:quantity, :transaction_type, :product_id, :_destroy])
    end
end
