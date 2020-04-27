class AlarmsController < ApplicationController

  def index
    # @alarm_time = @user.alarm_time
    unless  @alarm_time
      @alarm_time = AlarmTime.new
    end
      

  end

  def new
    @rate = Rate.new
  end

  def create
    @rate = Rate.create(params_rate)
  end

  def update
    @alarm_time = AlarmTime.create(params_alarm)
  end

  def show
  end

  private

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
