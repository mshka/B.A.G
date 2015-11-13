class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    creating_params ={
      date: booking_params[:date],
      user_comment: booking_params[:user_comment],
      number_of_people: booking_params[:number_of_people],
      viewed_by_place: false,
      viewed_by_user: false,
      status: 'sent',
      restaurant_comment: '',
      user_id: current_user.id,
      restaurant_id: params[:restaurant_id]
    }

    @booking = Booking.new(creating_params)

    if @booking.save
      flash[:notice] = "Booking request sent"
      redirect_to restaurant_path(params[:restaurant_id])
    else
      render :new
    end
  end

  def show_for_resto
    search_by = "bookings.#{params[:params]}"
    @new_bookings = Booking.where("bookings.restaurant_id = #{current_restaurant.id} AND bookings.viewed_by_place = #{false} AND bookings.status = 'sent'").order(search_by)
    @all_bookings = Booking.where("bookings.restaurant_id = #{current_restaurant.id} AND bookings.status = 'sent'").order(search_by)
    if (@all_bookings == @new_bookings and @new_bookings != [])
      @all_bookings = [0]
    else
      @all_bookings = @all_bookings - @new_bookings
    end
    @new_bookings.each do |booking|
      booking.viewed_by_place = true
      booking.save
    end
  end


  def acc_booking
    @booking = Booking.find(params[:id])
    @booking.status = 'accepted-show-pending'
    @booking.restaurant_comment = params[:restaurant_comment]
    @booking.save
    redirect_to restaurant_path(@booking.restaurant_id)
  end


  def reject_booking
    @booking = Booking.find(params[:id])
    @booking.status = 'rejected-show-pending'
    @booking.restaurant_comment = params[:restaurant_comment]
    @booking.save
    redirect_to restaurant_path(@booking.restaurant_id)

  end

  def oncomming_books
    search_by = "bookings.#{params[:params]}"
    @all_bookings = Booking.where("restaurant_id = #{current_restaurant.id} AND status iLIKE '%accepted%'").order(search_by)

    @todays_bookings = @all_bookings
    @todays_bookings = @todays_bookings.select{ |booking| booking.date.day() == Time.now.day() }

    if (@all_bookings == @todays_bookings and @todays_bookings != [])
      @all_bookings = [0]
    else
      @all_bookings = @all_bookings - @todays_bookings
    end
  end


  def show_for_user
    @pending_booking = Booking.where("user_id = #{current_user.id} AND status = 'sent'").order('updated_at DESC')
    @acc_booking = Booking.where("user_id = #{current_user.id} AND status iLIKE '%accepted%'").order('updated_at DESC')
    @rej_booking = Booking.where("user_id = #{current_user.id} AND status iLIKE '%rejected%'").order('updated_at DESC')
    @acc_booking.each do |booking|
      booking.status = 'accepted'
      booking.save
    end
    @rej_booking.each do |booking|
      booking.status = 'rejected'
      booking.save
    end
  end


  def show
    @booking = Booking.find(params[:id])
    @booking.status.slice!('-show-pending')
    @booking.save
    @user = User.find(@booking.user_id)
    @restaurant = Restaurant.find(@booking.restaurant_id)
  end


  def edit

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_books_path
  end


  private

  def booking_params
    params.require(:booking).permit(:date, :user_comment, :number_of_people)
  end
end

