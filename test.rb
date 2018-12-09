
dd=Time.now
$test_array = File.readlines('/home/bitlasoft/Downloads/dictionary.txt')
num_hash = {"2" => ["a","b","c"], "3" => ["d", "e", "f"], "4" => ["g", "h", "i"] ,"5" => ["j", "k", "l"], "6" => ["m", "n", "o"], "7" => ["p", "q", "r", "s"], "8" => ["t", "u", "v"],"9" =>  ["w" ,"x" , "y" , "z"]}
ph_no = "2282668687" 
def assignment(ph_no, num_hash, str="", index=0, result_arr =[])
	$result_arr = result_arr
	phn_no_arr = ph_no.split("")
	number_alpha_arr = num_hash[phn_no_arr[index]]
	if !number_alpha_arr.nil?
		number_alpha_arr.each do |v|
			result = "#{str}#{v}"
			if  (result.size > 2) && !($test_array.grep Regexp.new('\A' "#{result.upcase}" '\Z')).empty? 
				$result_arr.push result 
			end
			assignment(ph_no, num_hash, result, result.size, $result_arr) if result.size < 10
		end
	end
end
puts "#{$result_arr}"
assignment("2282668687", num_hash)
$final_result_hash = Hash.new
def assignment1(ph_no, num_hash, str="", index=0, final_result_hash ={}, act_size=0, key="")
	$final_result_hash = final_result_hash
	phn_no_arr = ph_no.split("")
	number_alpha_arr = num_hash[phn_no_arr[index]]
	if !number_alpha_arr.nil?
		number_alpha_arr.each do |v|
			result = "#{str}#{v}"
			if  ((result.size + act_size) == 10 )  && !($test_array.grep Regexp.new('\A' "#{result.upcase}" '\Z')).empty? 
				$final_result_hash[key] ||= Array.new
				$final_result_hash[key].push  result
			end
			assignment1(ph_no, num_hash, result, (act_size+result.size), $final_result_hash, act_size, key) if result.size < 10
		end
	end
end

if !$result_arr.empty?
	$result_arr.each do |result|
		assignment1(ph_no, num_hash, "" ,result.size, $final_result_hash, result.size,  result)
		$final_result_hash[result] = [] if $final_result_hash[result].nil?
	end
end

puts "#{$final_result_hash}" 
puts "#{Time.now-dd}"
	