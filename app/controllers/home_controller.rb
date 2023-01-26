class HomeController < ApplicationController
  def show
    $stderr.puts "Host: #{request.headers["Host"]}"
    $stderr.puts "X-Forwarded-Host: #{request.headers["X-Forwarded-Host"]}"
    redirect_to '/'
  end
end
