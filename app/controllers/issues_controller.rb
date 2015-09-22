class IssuesController < ApplicationController

  def index
		@issues = Issue.all
	end

  def show
  	@issue = Issue.find(params[:id])
  end

  def new
		@issue = Issue.new
    @neighborhoods = Issue::NEIGHBORHOODS
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
    params.require(:issue).permit(:description, :headline, :neighborhood)
  end
end
