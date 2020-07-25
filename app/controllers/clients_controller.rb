class ClientsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]
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

  private

  def client_params
    params.require(:client).permit(:name, :email, :address, :telephone)
  end
end
                                      