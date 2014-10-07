puts "Is your file a url? (yes/no)"
yn = gets.to_s.chomp
if yn.downcase == "yes"
puts "What is the url? (HTTPS Only!)"
require 'open-uri'
url = gets.to_s.chomp
f = open("#{url}"){|u|}
f.each_line {|line| p line}
a = f.readlines
num1 = a.collect do |split|
	split = split.split(",")
	split[1].to_i
	end
year = a.collect do |year|
	year = year.split(",") 
	year[0]
	end
a = a.map {|a| a.chomp}
sum = 0
tots = num1.inject{|sum,a| sum + a} 
numofarr = num1.length
meanie = tots / numofarr

sd = num1.collect do |splint|
 	sd = splint - meanie
	sd = sd**2
	end 
totalsd = sd.inject{|sum,a| sum + a}
var = totalsd / numofarr
stanDev = var**0.5 
puts "#{stanDev}"
yearNum = 0
z = num1.collect do |calc|
	z = (calc - meanie)/stanDev
		
	puts "The Z-Score for the year #{year[yearNum]} is #{z.round(5)}"
	yearNum = yearNum + 1
	end
f.close
puts "What file would you like to save the data to? (Be sure to add .dat to the end!)"
fileT = gets.chomp
g = File.new("#{fileT}","a+")
v = num1.collect do |calc|
        v = (calc - meanie)/stanDev

        g.puts "The Z-Score for the year #{year[yearNum]} is #{v.round(5)}"
        yearNum = yearNum + 1
end
elsif yn.downcase == "no"
puts "What file would you like? (Be sure to add .csv at the end!)"
file = gets.chomp

f = File.new("#{file}","r")
a = f.readlines
num1 = a.collect do |split|
	split = split.split(",")
	split[1].to_i
	end
year = a.collect do |year|
	year = year.split(",") 
	year[0]
	end
a = a.map {|a| a.chomp}
sum = 0
tots = num1.inject{|sum,a| sum + a} 
numofarr = num1.length
meanie = tots / numofarr

sd = num1.collect do |splint|
 	sd = splint - meanie
	sd = sd**2
	end 
totalsd = sd.inject{|sum,a| sum + a}
var = totalsd / numofarr
stanDev = var**0.5 
puts "#{stanDev}"
yearNum = 0
z = num1.collect do |calc|
	z = (calc - meanie)/stanDev
		
	puts "The Z-Score for the year #{year[yearNum]} is #{z.round(5)}"
	yearNum = yearNum + 1
	end
f.close
puts "What file would you like to save the data to? (Be sure to add .dat to the end!)"
fileT = gets.chomp
g = File.new("#{fileT}","a+")
v = num1.collect do |calc|
        v = (calc - meanie)/stanDev

        g.puts "The Z-Score for the year #{year[yearNum]} is #{v.round(5)}"
        yearNum = yearNum + 1
	end
g.close
else
puts "You did not enter any right commands!" 
end


