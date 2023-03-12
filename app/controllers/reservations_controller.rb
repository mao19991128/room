class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.all
  end

  def create
    @room = Room.find_by(params[:reservation][:room_id])
    @user = User.find_by(params[:reservation][:user_id])
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :number,:user_id, :room_id))
    if @reservation.save
      flash[:notice] = "予約の確定に移ります"
      redirect_to reservation_path(@reservation)
    else
      flash.now[:alert] = "予約に失敗しました"
      render "rooms/show"
      
    end
  end

  def show
    @reservation =Reservation.find(params[:id])
  end

  def edit
    @reservation =Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(params.require(:reservation).permit(:check_in, :check_out, :number))
      flash[:notice] = "予約を確定しました。"
      redirect_to reservation_index_path
    else
      flash.now[:alert] = "予約に失敗しました"
      render "rooms/show"
      
    end
  end

  def destroy
  end

end
