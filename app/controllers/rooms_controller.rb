class RoomsController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = Room.all
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = Room.new(room_params)  # フォームから送られてきたデータ(body)をストロングパラメータを経由して@tweetに代入
    @room.user_id = current_user.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to rooms_path(@room), notice: "施設を新規登録しました"
    else
      flash[:alert] = "施設を登録できませんでした"
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @user = User.find_by(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
     if @room.update(params.require(:room).permit(:name, :image, :fee, :introduction, :address))
       flash[:notice] = "施設情報を更新しました"
       redirect_to :rooms
     else
      flash[:alert] = "施設情報を更新できませんでした"
       render "edit"
     end
  end

  def destroy
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduction, :image, :fee, :created_at, :address)
  end
end
