class IssuesController < ApplicationController

  def index
		@issues = Issue.all
	end

  def new
		@issue = Issue.new
	end

  def show
  	@issue = Issue.find(params[:id])
  end


	def create
		@issue = Issue.new(issue_params)

		if @issue.save
			flash[:notice] =  'Issue Successfully Added!'
			redirect_to root_path
		else
			flash[:notice] =  'Fill that out right.'

			render :new
		end
	end

  protected
  def issue_params
    params.require(:issue).permit(:description, :neighborhood_id, :headline)
  end

end
