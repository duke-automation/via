class CreateBoomerangs < ActiveRecord::Migration
  def change
    create_table :boomerangs do |t|
      t.string :host
      t.string :clientip
      t.string :method
      t.integer :nt_con_end, :limit => 8
      t.integer :nt_con_st, :limit => 8
      t.integer :nt_dns_end, :limit => 8
      t.integer :nt_dns_st, :limit => 8
      t.integer :nt_domcomp, :limit => 8
      t.integer :nt_domcontloaded_end, :limit => 8
      t.integer :nt_domcontloaded_st, :limit => 8
      t.integer :nt_domint, :limit => 8
      t.integer :nt_domloading, :limit => 8
      t.integer :nt_fet_st, :limit => 8
      t.integer :nt_load_end, :limit => 8
      t.integer :nt_load_st, :limit => 8
      t.integer :nt_nav_st, :limit => 8
      t.integer :nt_nav_type, :limit => 8
      t.integer :nt_red_cnt, :limit => 8
      t.integer :nt_red_end, :limit => 8
      t.integer :nt_red_st, :limit => 8
      t.integer :nt_req_st, :limit => 8
      t.integer :nt_res_end, :limit => 8
      t.integer :nt_res_st, :limit => 8
      t.integer :nt_unload_end, :limit => 8
      t.integer :nt_unload_st, :limit => 8
      t.string :referer
      t.datetime :req_time
      t.integer :rt_bstart, :limit => 8
      t.integer :rt_end, :limit => 8
      t.string :rt_start
      t.integer :rt_tstart, :limit => 8
      t.string :user
      t.string :useragent
      t.string :http_ver
      t.string :location
      t.integer :status
      t.integer :t_done, :limit => 8
      t.integer :t_page, :limit => 8
      t.integer :t_resp, :limit => 8
      t.string :uri_path
      t.string :version
      t.integer :lat
      t.float :lat_err
      t.integer :bw, :limit => 8
      t.integer :bw_err, :limit => 8
      t.integer :bw_time

      t.timestamps null: false
    end
  end
end

