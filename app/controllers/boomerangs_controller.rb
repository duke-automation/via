class BoomerangsController < ApplicationController

  def mystatus
    @start_range = (Time.now - 14400).strftime("%b%d %l:%M%P")
    @end_range = (Time.now).strftime("%b%d %l:%M%P")
    @beacon = APP_CONFIG['beacon_host']
    if Boomerang.exists?(:host => @beacon)
      @viahostabw = (Boomerang.avg_beacon(@beacon,'bw') or 0).round(2)
      @viahostalat = (Boomerang.avg_beacon(@beacon,'lat') or 0).round(2)
      @viahostabw = ((@viahostabw or 0) * 8 / 1024 / 1024).round(2)
    end
  end

  def stats
    beacon = APP_CONFIG['beacon_host']
    if params[:start_date].present?
      tstart = DateTime.strptime(params[:start_date], '%m-%d-%Y %H:%M').change(:offset => "-0400")
      tend = DateTime.strptime(params[:start_date], '%m-%d-%Y %H:%M').change(:offset => "-0400") + params[:plus_hours].to_i.hours
    else
      tstart = Time.now - 8.hours
      tend = Time.now
    end
    @bandwidth = Boomerang.where('host=? and bw>?', beacon, 0).group_by_hour(:req_time, format: "%l%P",range: tstart..tend).average(:bw)
    @bandwidth.each { |k, v| @bandwidth[k] = (v * 8 / 1024 / 1024).round(2)}
    @nwlatency = Boomerang.where(host: beacon).group_by_hour(:req_time, format: "%l%P",range: tstart..tend).average(:lat)
  end

  # set attributes for javascript via gon gem
  def viahost_setup
    gon.requestip = request.remote_ip
    gon.base = request.base_url
    $RESOURCE_LOGGER.info "base_url = #{request.base_url}, request_host = #{request.host}"
    gon.useragent = request.user_agent
    gon.rmethod = request.method
    gon.req_time = Time.now.to_i
    gon.uri_path = request.filtered_path
    gon.host = request.host
    gon.viahostbw = ((Boomerang.avg_beacon(APP_CONFIG['beacon_host'],'bw') or 0) * 8 / 1024 / 1024).round(2)
    gon.viahostlat = (Boomerang.avg_beacon(APP_CONFIG['beacon_host'],'lat') or 0).round(2)
    render layout: 'viahost'
  end

  def index
    if params[:query].present?
      if params[:start_date].present? and params[:end_date].present?
        $RESOURCE_LOGGER.info "s = #{params[:start_date]}, e = #{params[:end_date]}"
        sdate = DateTime.strptime(params[:start_date], '%m-%d-%Y %H:%M').change(:offset => "-0400")
        edate = DateTime.strptime(params[:end_date], '%m-%d-%Y %H:%M').change(:offset => "-0400")
        $RESOURCE_LOGGER.info "s = #{sdate}, e = #{edate}"
        @boomerangs = Boomerang.where(:created_at => sdate..edate).where("host like ? or clientip like ?", "%#{params[:query]}%", "%#{params[:query]}%").reverse_order.paginate(:page => params[:page])
      else
        # @boomerangs = Boomerang.all.reverse_order.paginate(:page => params[:page])
        @boomerangs = Boomerang.where("host like ? or clientip like ?", "%#{params[:query]}%", "%#{params[:query]}%").reverse_order.paginate(:page => params[:page])
      end
    else
      if params[:start_date].present? and params[:end_date].present?
        $RESOURCE_LOGGER.info "s = #{params[:start_date]}, e = #{params[:end_date]}"
        sdate = DateTime.strptime(params[:start_date], '%m-%d-%Y %H:%M').change(:offset => "-0400")
        edate = DateTime.strptime(params[:end_date], '%m-%d-%Y %H:%M').change(:offset => "-0400")
        $RESOURCE_LOGGER.info "s = #{sdate}, e = #{edate}"
        @boomerangs = Boomerang.where(:created_at => sdate..edate).paginate(:page => params[:page])
      else
        @boomerangs = Boomerang.all.reverse_order.paginate(:page => params[:page])
      end
    end
  end

  def show
  end

  def new
    @boomerang = Boomerang.new
  end

  def edit
  end

  def boompost
    if params['t_page'].nil?
      render :text => ""
      return
    end
    # rename input names to match column names
    replacements = { "rt.start" => "rt_start", "rt.bstart" => "rt_bstart", "rt.end" => "rt_end", "rt.start" => "rt_start", "r" => "referer" }
    replacements.each do |k, v|
      params[v] = params.delete(k)
    end
    ## filter out params we don't need/use
    # permitted params
    columns = Boomerang::BOOMERANG_COLUMNS
    columns = columns.map { |x| x.to_s }
    # filter params, keep only the ones we care about
    filtered = params.slice(*columns).to_hash
    # convert time to epoch
    filtered['req_time'] = Time.at(filtered['req_time'].to_i)
    Boomerang.new(filtered).save
    render :text => ""
  end

  def create
  end

  def update
    respond_to do |format|
      if @boomerang.update(boomerang_params)
        format.html { redirect_to @boomerang, notice: 'Boomerang was successfully updated.' }
        format.json { render :show, status: :ok, location: @boomerang }
      else
        format.html { render :edit }
        format.json { render json: @boomerang.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @boomerang.destroy
    respond_to do |format|
      format.html { redirect_to boomerangs_url, notice: 'Boomerang was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_boomerang
    @boomerang = Boomerang.find(params[:id])
    logger.debug "Getting boomerang: #{@boomerang.inspect}"
  end

  def boomerang_params
    fields = Boomerang::BOOMERANG_COLUMNS
    params.require(:boomerang).permit(*fields)
  end

end
