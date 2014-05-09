class ExportController < ApplicationController
  def index
    checkins = CheckIn.all
    respond_to do |format|
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = 'attachment; filename=all.csv'    
        render :template => "export/index.csv.erb", :locals => { :checkins => checkins }
      end
    end
  end
end
