VIAHOST.init(
  beacon_url: gon.base + "/boomerangs/boompost"
  autorun: false
  BW:
    base_url: gon.base + '/images/'
#    cookie: 'VIAHOST-BW'
    cookie: null
    cookie_exp: 120
    block_beacon: true
    test_https: true
  RT:
#    cookie: 'VIAHOST-RT'
    cookie: null
    cookie_exp: 120
    test_https: true
    block_beacon: true).addVar
      'clientip': gon.requestip
      'useragent': gon.useragent
      'method': gon.rmethod
      'req_time': gon.req_time
      'uri_path': gon.uri_path
      'host': "localhost"
