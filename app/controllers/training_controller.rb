class TrainingController < ApplicationController
  def courses
    @courses = Course.all.order( :id => "ASC" )
  end
end
