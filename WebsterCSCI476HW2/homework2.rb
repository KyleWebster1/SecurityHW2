#global name of myself
$name = "Kyle Webster"

def main_loop()
  #checks for an argument, if there is none, exit on error
  if ARGV.length < 1
    puts "You must specify the file name as the argument."
    exit 4
  end

  # process the file (Required an argument of just the file name) and save each line as a seperate array (for simplicity)
  text_arr = File.readlines(ARGV[0])
  #write to the output all results
  aFile = File.new("output.txt", "r+")
  if aFile
    #Writes to output the introductions for the content
    aFile.syswrite "CSCI 476 Homework 2 submitted by #{$name}\n"
    aFile.syswrite "There is #{text_arr.length} track I records in the file\n\n"
    #keeps track of the current track being matched
    count = 0
    text_arr.each do |text|
      count += 1
      # matches the regular expression to the current element in text_arr with a seperate group for the elements I need for later
      text.match /(\%\w)(\d{,4})(\d{,4})(\d{,4})(\d{,4})\^([a-zA-Z]*)\/([a-zA-Z]*)\^(\d{,2})(\d{,2})(\d{,3})(.*?\?)/
      #changes the output based on the count(For proper english purposes only)
      if count == 1
        aFile.syswrite "<information on #{count}st record>\n"
      elsif count == 2
        aFile.syswrite "<information on #{count}nd record>\n"
      elsif count == 3
        aFile.syswrite "<information on #{count}rd record>\n"
      else
        aFile.syswrite "<information on #{count}th record>\n"
      end
      #prints the card information from the required groups
      aFile.syswrite "Cardholder's Name: #{$6} #{$7}\n"
      aFile.syswrite "Card Number:#{$2} #{$3} #{$4} #{$5}\n"
      aFile.syswrite "Expiration Date: #{$9}/20#{$8}\n"
      aFile.syswrite "CVC Number: #{$10}\n"
      aFile.syswrite "\n"
    end
else
    puts "UNABLE TO OPEN FILE"
end

end

if __FILE__==$0
  main_loop()
end
