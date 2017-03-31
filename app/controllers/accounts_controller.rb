class AccountsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to @account
    else
      render 'new'
    end
  end

  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @account }
    end
  end

  def index
    @accounts = Account.all

    respond_to do |format|
      format.html
      format.json { render json: @accounts }
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])

    if @account.update(account_params)
      redirect_to @account
    else
      render 'edit'
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    redirect_to accounts_path
  end

  def balance
    @account = Account.find(params[:id])
    @balance = @account.balance
    @currency = 'EUR'

    respond_to do |format|
      format.html
      format.json { render json: { balance: @balance, currency: @currency } }
    end
  end

  private
    def account_params
      params.require(:account).permit(:first_name, :last_name, :balance)
    end

    def not_found(error)
      respond_to do |format|
        format.html { render 'errors/404' , status: 404 }
        format.json { render json: { error: error.message }, status: :not_found }
      end
    end
end
