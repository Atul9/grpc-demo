this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'server_status_services_pb'

class StatusServer < Server::Status::Service
  def handle_request()
    Server::DiskStatus.new(message: "Hello")
  end
end

def server
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:3000', :this_port_is_insecure)
  s.handle(StatusServer)
  s.run_till_terminated
end

server
