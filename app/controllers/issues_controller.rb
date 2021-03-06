class IssuesController < ApplicationController
  respond_to :html, :js

  def index
    @issues = Issue.all
    @not_completed_issues = []
    @issues.each do |issue|
      if !issue.completed?
        @not_completed_issues << issue
      end
    end
    respond_to do |format|
      format.html
      format.json { render json: @not_completed_issues }
    end
  end

  def show
  	@issue = Issue.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @issue }
    end
  end

  def new
		@issue = Issue.new
  end

	def create
  	@issue = Issue.new(issue_params)

		if @issue.save
      # IssueMailer.issue_notification(@issue, @program.user).deliver_later
      respond_to do |format|
        format.html do
    			flash[:notice] = "Issue Successfully Added!"
    			redirect_to root_path
        end
        format.json { render json: { status: 200 } }
      end
		else
      respond_to do |format|
        format.html do
          flash[:notice] = @issue.errors.full_messages.join(". ")
          redirect_to new_issue_path
        end
        format.json { render json: { status: 500 } }
      end
		end
	end

  def destroy
    if current_user.try(:admin?)
      @issue = Issue.find(params[:id])
      @issue.destroy
      flash[:notice] = 'Issue deleted.'
      redirect_to root_path
    else
      redirect_to root_path
      flash[:notice] = "Only admins can delete submissions!"
    end
  end

  def update
    @issue = Issue.find(params[:id])

    if @issue.update(issue_params)
      flash[:notice] = "Issue Edited"
      redirect_to root_path
    else
      flash[:notice] = @issue.errors.full_messages.join(". ")
      redirect_to edit_issue_path(@issue)
    end
  end

  def edit
    if current_user.try(:admin?)
      @issue = Issue.find(params[:id])
    else
      flash[:notice] = "This portion of the site is for admins only!"
      redirect_to root_path
    end
  end

  protected

  def issue_params
    params.require(:issue).permit(:description, :headline, :longitude,
      :latitude, :completed, :address)
  end
end
