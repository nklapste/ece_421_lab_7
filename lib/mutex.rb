#!/usr/bin/env ruby

Thread.abort_on_exception = true

@fruits = ['apple', 'banana', 'cherry']

@mutex = Mutex.new

def print_name(id)
    @mutex.lock
    
    5.times do |t|
        puts @fruits[id]
    end
    
    @mutex.unlock
end

threads = []

3.times do |i|
    threads << Thread.new(i) {|id| print_name(id) }
end

threads.each { |t|  t.join }
