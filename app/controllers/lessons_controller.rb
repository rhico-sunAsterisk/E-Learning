class LessonsController < ApplicationController
    before_action :find_lesson, only: [:show, :edit, :update, :destroy]

    def lesson
        @lesson = Lesson.all.order("created_at DESC")
    end

    def show
    end

    def new
        @lesson = Lesson.new
    end

    def create
        @lesson = Lesson.new(lesson_params)

        if@lesson.save
            redirect_to @lesson, notice: "Successfully created new Lesson!"
        else
            render 'new'
        end
    end

    def edit
    end

    private

    def lesson_params
        params.require(:lesson).permit(:title, :description)
    end

    def find_lesson
        @lesson = Lesson.find(params[:id])
    end
end
