class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_ticket, only: %i[new create destroy]

  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.ticket = @ticket
    if @message.save
      redirect_to ticket_path(@ticket)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @message.update(message_params)
    redirect_to ticket_path(@ticket)
  end

  def destroy
    @message.destroy
    redirect_to ticket_path(@ticket), status: :see_other
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
