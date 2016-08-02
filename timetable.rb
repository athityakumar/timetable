require 'date'

subjects = []

subjects.push( { "Code" => "MT30001" , "Subject" => "Materials Engineering" , "Place" => "NR421" , "Slot" => { "Monday" => "08-10" , "Tuesday" => "12-01" }} )
subjects.push( { "Code" => "ME30005" , "Subject" => "Heat Transfer" , "Place" => "NC242" , "Slot" => { "Monday" => "10-11" , "Wednesday" => "08-10" , "Thursday" => "10-11" }} )
subjects.push( { "Code" => "HS30068" , "Subject" => "Symbolic Logic" , "Place" => "NR123" , "Slot" => { "Monday" => "11-12" , "Tuesday" => "08-10" }} )
subjects.push( { "Code" => "ME31007" , "Subject" => "CFW" , "Place" => "NR321" , "Slot" => { "Monday" => "12-01" , "Tuesday" => "10-12" , "Thursday" => "08-09" }} )
subjects.push( { "Code" => "MA21007" , "Subject" => "Design & Analysis of Algo" , "Place" => "NR322" , "Slot" => { "Monday" => "03-05" , "Tuesday" => "02-04" }} )
subjects.push( { "Code" => "ME31013" , "Subject" => "Mech of solids" , "Place" => "NR322" , "Slot" => { "Wednesday" => "12-01" , "Thursday" => "11-12" , "Friday" => "09-11" }} )
subjects.push( { "Code" => "ME39013" , "Subject" => "Mech of solids - Lab" , "Place" => "Dept" , "Slot" => { "Thursday" => "02-05" }} )
subjects.push( { "Code" => "ME39007" , "Subject" => "CFW - Lab" , "Place" => "Dept" , "Slot" => { "Friday" => "02-05" }} )

puts ""
print "Enter day (Default day is today = #{Date.today.strftime("%A")}) : "
day , found , match = gets.chomp.to_s , 0 , []
day = day.length == 0 ? Date.today.strftime("%A") : day

subjects.each do |subject|
  if subject["Slot"].keys.include? day
    if found == 0
      puts ""
    end
    val = subject["Slot"][day].split("-")[0].to_i
    if val <= 6
      subject["Slot"][day] = subject["Slot"][day].gsub("0"+val.to_s,(val+12).to_s)
    end
    match.push(subject)
    found = found + 1
  end
end

match = match.sort_by { |row| row["Slot"][day].split("-")[0].to_i }
match.each do |subject|
  time = subject["Slot"][day].split("-")[0].to_i
  if time > 12
    real_time = "0"+subject["Slot"][day].gsub(time.to_s,(time-12).to_s) 
    puts "#{real_time} - #{subject["Subject"]} (#{subject["Code"]}) - #{subject["Place"]} "
  else
    puts "#{subject["Slot"][day]} - #{subject["Subject"]} (#{subject["Code"]}) - #{subject["Place"]} "
  end
end

puts "\nFound #{found} classes for #{day}"
puts ""