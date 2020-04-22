class AlarmsController < ApplicationController

  def index
  end

  def new
    @rate = Rate.new
  end

  def create
    binding.pry
    @rate = Rate.create(params_rate)
  end

  def show
  end

  private

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
