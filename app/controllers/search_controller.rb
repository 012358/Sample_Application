class SearchController < ApplicationController

  if params[:q].nil?
    @projects = []
  else
    @projects = Project.search(params[:q])
  end

end
