# Set the working application directory
# working_directory "/path/to/your/app"
root = '/var/www/bookmycook'
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"
listen '/tmp/unicorn.bookmycook.sock'
before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end   
end
listen 8200
worker_processes 2
timeout 360