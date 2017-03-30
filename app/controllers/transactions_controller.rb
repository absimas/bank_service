class TransactionsController < ApplicationController
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
  end

  def index
    @transactions = Transaction.all
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

  private
    def transaction_params
      params.require(:transaction).permit(:sender_id, :recipient_id, :amount)
    end
end
