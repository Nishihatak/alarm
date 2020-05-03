class AlarmsController < ApplicationController

  before_action :show, only: :update
  
  def index
    if user_signed_in?  
      @user = User.find(current_user.id) 
      @alarm_time = @user.alarm_time
    end
  end

  def new
    @rate = Rate.new
  end

  def create
    @rate = Rate.new(params_rate)
    unless @rate.valid?
      render action: :new  and return 
    end
    @rate = Rate.create(params_rate)
  end

  def update
    unless @alarm_time.valid?
      render action: :show  and return 
    end
    @alarm_time =  AlarmTime.find_by(user_id: current_user.id)
    if @alarm_time
      @alarm_times = @alarm_time.update(params_alarm)
    else
      @alarm_time = AlarmTime.create(params_alarm)
    end
    # @alarm_time = Time.new(
    #   params[:alarm_time][:"time(1i)"].to_i,
    #   params[:alarm_time][:"time(2i)"].to_i,
    #   params[:alarm_time][:"time(3i)"].to_i,
    #   params[:alarm_time][:"time(4i)"].to_i,
    #   params[:alarm_time][:"time(5i)"].to_i
    # )
  end

  def show
    @user = User.find(current_user.id) 
    @alarm_time = @user.alarm_time
    unless  @alarm_time
      @alarm_time = AlarmTime.new
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def params_alarm
      params.require(:alarm_time).permit(
        :time
      ).merge(user_id: current_user.id)

    end


    def params_rate
      params.require(:rate).permit(
        :feel,
        :sleep,
        :awake,
        :tired,
        :body,
        :memo
      ).merge(user_id: current_user.id)
    end
end
