class Api::V1::BoomerangsController < Api::ApiBaseController

  after_filter only: [:index] { set_pagination_header(:boomerangs) }

  def show
  end

  def get_records
    total = Boomerang.count
    first_possible = Boomerang.first.id
    last_possible = Boomerang.last.id
    limit = 10000
    last = total
    first = total - 1000
    range = params[:range] ||= first..last
    to_num = "#{range}".split('..').map{|d| Integer(d)}
    range = to_num[0]..to_num[1]
    @boomerangs = Boomerang.where(:id => range)
    date_range = "#{@boomerangs.first.created_at.to_i}..#{@boomerangs.last.created_at.to_i}"
    respond_to do |format|
      if range.count > limit
        format.json { render :json => { :status => "error", :message => "Range #{range} with a count of #{range.count} is over the limit of #{limit} per query"} }
      else
        format.json { render :json => { :status => "ok", :info => {:total_records => total, :range_available => first_possible..last_possible, :request_limit => limit, :current_count => range.count, :current_range => range, :current_date_range => date_range}, :records => @boomerangs} }
      end
    end
  end

end
