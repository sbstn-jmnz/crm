class ApplicantsController < ApplicationController
 before_filter :authenticate_applicant!, :only => [:index, :new]
 def index
 end
 def new
 end
 def edit
 end
end
