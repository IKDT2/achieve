require 'webrick'

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}

server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'techtest.html.erb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goyacheck.rb')
server.mount('/goya2.cgi', WEBrick::HTTPServlet::CGIHandler, 'goyacheck2.rb')
server.start