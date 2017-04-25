<!DOCTYPE HTML>
<html>
<head>
<title>Via</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
</head>
<body>

<p id="results">
</p>

<script src="boomerang/boomerang.js" type="text/javascript"></script>
<script src="boomerang/plugins/bw.js" type="text/javascript"></script>
<script src="boomerang/plugins/navtiming.js" type="text/javascript"></script>
<script src="boomerang/plugins/rt.js" type="text/javascript"></script>
<script src="boomerang/howtos.js" type="text/javascript"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
BOOMR.init({
          beacon_url: "https://your-via-site.edu/boomerangs/boompost",
          BW: {
            base_url: "http://your-target-site.edu/images/",
            cookie: null,
            cookie_exp: 120,
            block_beacon: true
          },
          RT: {
            cookie: null,
            cookie_exp: 120,
            block_beacon: true
          }
    }).
    addVar({
      "clientip": "<?php echo $_SERVER['REMOTE_ADDR'] ?>",
      "useragent": "<?php echo $_SERVER['HTTP_USER_AGENT'] ?>",
      "http_ver": "<?php echo $_SERVER['SERVER_PROTOCOL'] ?>",
      "method": "<?php echo $_SERVER['REQUEST_METHOD'] ?>",
      "req_time": "<?php echo $_SERVER['REQUEST_TIME'] ?>",
      "uri_path": "<?php echo $_SERVER['REQUEST_URI'] ?>",
      "host": "<?php echo $_SERVER['SERVER_NAME'] ?>",
    });
</script>
</body>
</html>
