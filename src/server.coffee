# udp = require './udp'
http = require './http'
{udp_port, udp_host, http_port} =  require './config'

# udp.bind udp_port, udp_host

http.listen http_port, (e) =>
  if e then console.error e else console.log "server listening on #{http_port}"
