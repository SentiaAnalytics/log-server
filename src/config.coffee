module.exports =
  rethinkdb:
    host: process.env.RETHINKDB_PORT_28015_TCP_ADDR
    port: process.env.RETHINKDB_PORT_28015_TCP_PORT
  udp_port: process.env.UDP_PORT
  http_port: process.env.HTTP_PORT
