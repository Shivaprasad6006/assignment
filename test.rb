ph_no = gets
ph_no.chomp.to_s
dd=Time.now
$test_array = File.readlines('/home/bitlasoft/Downloads/dictionary.txt')
$test_array = ["motor", "usual", "noun", "struck", "nouns", "truck", "onto", "motortruck", "act", "amounts", "contour", "acta", "mounts", "bat", "cat", "catamounts"]
num_hash = {"2" => ["a","b","c"], "3" => ["d", "e", "f"], "4" => ["g", "h", "i"] ,"5" => ["j", "k", "l"], "6" => ["m", "n", "o"], "7" => ["p", "q", "r", "s"], "8" => ["t", "u", "v"],"9" =>  ["w" ,"x" , "y" , "z"]}
def assignment(ph_no, num_hash, str="", index=0, result_arr =[])
	$result_arr = result_arr
	phn_no_arr = ph_no.split("")
	number_alpha_arr = num_hash[phn_no_arr[index]]
	if !number_alpha_arr.nil?
		number_alpha_arr.each do |v|
			result = "#{str}#{v}"
			if  (result.size > 2) && !($test_array.grep Regexp.new('\A' "#{result}" '\Z')).empty? 
				$result_arr.push result 
			end
			assignment(ph_no, num_hash, result, result.size, $result_arr) if result.size < 10
		end
	end
end
assignment(ph_no, num_hash)
$final_result_hash = Hash.new
def assignment1(ph_no, num_hash, str="", index=0, final_result_hash ={}, act_size=0, key="")
	$final_result_hash = final_result_hash
	phn_no_arr = ph_no.split("")
	number_alpha_arr = num_hash[phn_no_arr[index]]
	if !number_alpha_arr.nil?
		number_alpha_arr.each do |v|
			result = "#{str}#{v}"
			if  ((result.size + act_size) == 10 )  && !($test_array.grep Regexp.new('\A' "#{result}" '\Z')).empty? 
				$final_result_hash[key] ||= Array.new
				$final_result_hash[key].push  result
			end
			assignment1(ph_no, num_hash, result, (act_size+result.size), $final_result_hash, act_size, key) if result.size < 10
		end
	end
end
final_arr = Array.new
if !$result_arr.empty?
	$result_arr.each do |result|
		assignment1(ph_no, num_hash, "" ,result.size, $final_result_hash, result.size,  result)
		$final_result_hash[result] = [] if $final_result_hash[result].nil?
	end
	$final_result_hash.each do |k, v|
		if !v.empty?
			v.each{|a|
				final_arr.push [k, a]
			}
		else
			final_arr.push k
		end
	end

end

puts "#{final_arr}" 
puts "#{Time.now-dd}"
	