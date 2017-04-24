<script type="application/javascript">
  // control test run by user-agent
  var isAgent = {
    OutlookApp: function() {
      return navigator.userAgent.match(/iPhone/);
    },
    any: function() {
        return (isAgent.OutlookApp());
    }
  };
  (function() {
    if( isAgent.any() ) { return; };
    var epoch = Math.floor(Date.now() / 1000);
    var base = "https://your-target-site.edu";
    host = base.replace(new RegExp('http.*://',''),'');
    BOOMR.init({
         beacon_url: "https://your-via-site.edu/boomerangs/boompost",
         beacon_type: 'POST',
         BW: {
           base_url: base + '/images/',
           cookie: "<%=request.getServerName()%>-bw",
           cookie_exp: 120,
           test_https: true,
           nruns: 5,
           block_beacon: true
         },
         RT: {
           cookie: "<%=request.getServerName()%>-rt",
           cookie_exp: 120,
           test_https: true,
           block_beacon: true
         }
    }).
    addVar({
      "clientip": "<%=request.getRemoteAddr()%>",
      "useragent": "<%=request.getHeader("User-Agent")%>",
      "http_ver": "<%=request.getProtocol()%>",
      "method": "<%=request.getMethod()%>",
      "req_time": epoch,
      "uri_path": "<%=request.getRequestURI()%>",
      "host": host,
      "protocol": "<%=request.getScheme()%>"
    });
  })();
</script>
