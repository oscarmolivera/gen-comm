class ClientsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create update destroy]
  before_action :set_client, only: %i[edit update destroy]
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
        format.js
      else
        format.js { render :new, status: :method_not_allowed }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.js
      else
        format.js { render :new, status: :method_not_allowed }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to { |format| format.js }
  end

  private

  def client_params
    params.require(:client).permit(:name, :email, :address, :telephone)
  end

  def set_client
    @client = Client.find(params[:id])
  end
end
