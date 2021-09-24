require 'sinatra'
#require 'rest-client'
#require './http_utils'
#require 'open3'
require 'linkeddata'


include HTTPUtils

get '/' do
  
  xform()
  $stderr.puts "Execution complete.  See docker log for errors (if any)\n\n"
  "Execution complete.  See docker log for errors (if any)\n\n"
end

def xform

  files = Dir.read("/data/triples/*.nt")
  
  files.each do |f|
      match = f.match(/([^\.]+)\.nt/)
      filename = "#{match[1]}.ttl"
      `rdf --output-format ttl --output /data/triples/#{filename} serialize #{f}`
  end

end
