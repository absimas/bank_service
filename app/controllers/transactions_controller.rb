class TransactionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to @transaction
    else
      render 'new'
    end
  end

  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @transaction }
    end
  end

  def index
    @transactions = Transaction.all

    respond_to do |format|
      format.html
      format.json { render json: @transactions }
    end

  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])

    if @transaction.update(transaction_params)
      redirect_to @transaction
    else
      render 'edit'
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    redirect_to transactions_path
  end

  def sender
    @transactions = Transaction.where(sender_id: params[:id])
    puts @transactions.size
    render 'index'
  end

  def recipient
    @transactions = Transaction.where(recipient_id: params[:id])
    render 'index'
  end

  def account
    @transactions = Transaction.where(recipient_id: params[:id]).or(Transaction.where(sender_id: params[:id]))
    render 'index'
  end

  private
    def transaction_params
      params.require(:transaction).permit(:sender_id, :recipient_id, :amount)
    end

    def not_found(error)
      respond_to do |format|
        format.html { render 'errors/404' , status: 404 }
        format.json { render json: { error: error.message }, status: :not_found }
      end
    end
end
