class ReservationsController < ApplicationController
  def index
    @users = User.all
    @rooms = Room.all
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @room = Room.find_by(params[:reservation][:room_id])
    @rooms = Room.all
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :number))
    if @reservation.save
      flash[:notice] = "予約の確定に移ります"
      redirect_to reservation_path(reservation)
    else
      flash.now[:alert] = "予約に失敗しました"
      render "rooms/show"
      
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
