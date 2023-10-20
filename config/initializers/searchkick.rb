require 'faraday_middleware/aws_sigv4'

Searchkick.client.transport.connections.each do |connection|
  connection.connection.builder.use(FaradayMiddleware::AwsSigV4, {
    service: 'es',
    region: 'ap-northeast-1',
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  })
end
