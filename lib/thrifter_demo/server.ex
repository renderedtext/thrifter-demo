defmodule ThrifterDemo.Daemon do
  use Riffed.Server,
    service: :test_thrift,
    structs: ThrifterDemo.Model,
    functions: [
      add: &ThrifterDemo.RequestHandler.add/2,
      sub: &ThrifterDemo.RequestHandler.sub/2,
    ],
    server: {:thrift_socket_server,
         port: 12345,
         framed: true,
         max: 10_000,
         socket_opts: [
           recv_timeout: 3000,
           keepalive: true]
    }


end
