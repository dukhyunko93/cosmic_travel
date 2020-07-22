class MissionsController < ApplicationController
    def new
        @mission = Mission.new
        @scientists = Scientist.all.sort_by{|s| s.name}
        @planets = Planet.all.sort_by{|s| s.name}
    end

    def create
        @mission = Mission.new(params_method)
        if @mission.save
            redirect_to scientist_path(@mission.scientist)
        else
            flash[:user_error] = @mission.errors.full_messages
            redirect_to new_mission_path
        end
    end

    private

    def params_method
        params.require(:mission).permit(:name, :planet_id, :scientist_id)
    end

end
