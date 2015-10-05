class SkillsController < ApplicationController
   before_action :set_skill, only: [:show, :edit, :update, :destroy]

  def index
    @skills = Skill.all
  end

  def show
  end

  def new
    @skill = Skill.new
  end

  def edit
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.save
    redirect_to skills_path
  end

  def update
    @skill.update(skill_params)
    redirect_to skills_path
  end

  def destroy
    @skill.destroy
    redirect_to skills_path
  end

  private
    def set_skill
      @skill = Skill.find(params[:id])
    end

    def skill_params
      params.require(:skill).permit(:name, :skill_type_id)
    end
end
