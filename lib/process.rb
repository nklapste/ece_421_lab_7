#!/usr/bin/env ruby

require 'open3'

output, status = Open3.capture2("ls /usr")

list_files = output.split("\n")
print "Output: #{list_files}\n"
print "PID: #{status.pid}\n"
print "Exit status: #{status.exitstatus}\n"

print "---------------------------------------\n"

Open3.popen3("ruby") { |stdin, stdout, stderr|
    stdin.write "print RUBY_VERSION"
    stdin.close # Send EOF signal
    output = stdout.read
    print "Output: #{output}\n"
}

print "---------------------------------------\n"

Open3.popen3("ruby") { |stdin, stdout, stderr|
    stdin.write "print ERR_RUBY_VERSION"
    stdin.close # Send EOF signal
    err = stderr.read
    print "Error message: #{err}\n"
}

