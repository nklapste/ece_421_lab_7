#!/usr/bin/env ruby

Thread.abort_on_exception = true

@fruits = ['apple', 'banana', 'cherry']

def print_name(id)
    5.times do |t|
        puts @fruits[id]
    end
end

threads = []

3.times do |i|
    threads << Thread.new(i) {|id| print_name(id) }
end

threads.each { |t|  t.join }
