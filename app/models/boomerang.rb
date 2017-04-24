class Boomerang < ActiveRecord::Base

  # boomerang attributes
  BOOMERANG_COLUMNS = [
      :host,
      :bw,
      :bw_err,
      :bw_time,
      :lat,
      :lat_err,
      :clientip,
      :method,
      :nt_con_end,
      :nt_con_st,
      :nt_dns_end,
      :nt_dns_st,
      :nt_domcomp,
      :nt_domcontloaded_end,
      :nt_domcontloaded_st,
      :nt_domint,
      :nt_domloading,
      :nt_fet_st,
      :nt_load_end,
      :nt_load_st,
      :nt_nav_st,
      :nt_nav_type,
      :nt_red_cnt,
      :nt_red_end,
      :nt_red_st,
      :nt_req_st,
      :nt_res_end,
      :nt_res_st,
      :nt_unload_end,
      :nt_unload_st,
      :referer,
      :req_time,
      :rt_bstart,
      :rt_end,
      :rt_start,
      :rt_tstart,
      :user,
      :useragent,
      :http_ver,
      :location,
      :status,
      :t_done,
      :t_page,
      :t_resp,
      :uri_path,
      :version
  ]

  # return average / default of last 4 hours
  def self.avg_beacon(beacon,metric,hrs=4)
    if Boomerang.exists?(:host => beacon)
      Boomerang.where(created_at: (DateTime.now - hrs.hours)..DateTime.now).where(host: beacon).average(metric.to_sym)
    end
  end

end
