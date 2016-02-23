#!/usr/bin/ruby
# encoding: utf-8
require 'httparty'
require 'json'

# curl https://upay.10010.com/npfweb/NpfCellWeb/Mustpayment/getMustpayment\?number\=18601199630\&GET
print "Phone Number: "
number = gets 

res = HTTParty.get("https://upay.10010.com/npfweb/NpfCellWeb/Mustpayment/getMustpayment?number=#{number}")
puts "U should pay " + JSON.parse(res.body)['mustPay'].to_s + " this month"

