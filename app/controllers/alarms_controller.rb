class AlarmsController < ApplicationController

  before_action :show, only: :update
  
  def index
    @user = User.find(current_user.id) 
    @alarm_time = @user.alarm_time

    binding.pry
  end

  def new
    @rate = Rate.new
  end

  def create
    @rate = Rate.create(params_rate)
  end

  def update
    @rate = Rate.new
    @user = User.find(current_user.id) 
    @alarm_time = @user.alarm_time
    if @alarm_time
      @alarm_time = AlarmTime.update(params_alarm)
    else
      @alarm_time = AlarmTime.create(params_alarm)
    end
  end

  def show
    @rate = Rate.new
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
