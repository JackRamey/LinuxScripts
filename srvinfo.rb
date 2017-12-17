#!/usr/bin/ruby
require 'net/http'

# Get the first argument from the command-line (the URL)
url = ARGV[0]

begin

  # Create a new HTTP connection
  httpCon = Net::HTTP.new( url, 80 )
  print "New connection created.\n"

  # Perform a HEAD request
  resp, data = httpCon.head( "/", nil )

  # If it succeeded (200 is success)
  if resp.code == "200" then

    # Iterate through the response hash
    resp.each {|key,val|

      # If the key is the server, print the value
      if key == "server" then

        print "  The server at "+url+" is "+val+"\n"

      end

    }

  end

end

