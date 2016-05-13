{curry} = require 'ramda'
rethink = require 'rethinkdb'
url = require 'url'

insert = curry (table, doc, conn) =>
  rethink.table(table).insert(doc).run(conn)

module.exports = (rethinkUrl) =>
  {hostname, port} = url.parse rethinkUrl
  connection = rethink.connect host: hostname, port: port

  insert: curry (table, doc) => connection.then insert(table, doc)
