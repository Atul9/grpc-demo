# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: server_status.proto for package ''

require 'grpc'
require 'server_status_pb'

module Server
  class Service

    include GRPC::GenericService

    self.marshal_class_method = :encode
    self.unmarshal_class_method = :decode
    self.service_name = 'Server'

    rpc :Status, ServerRequest, DiskStatus
  end

  Stub = Service.rpc_stub_class
end
