require "correlation_of_two_arrays/version"

module CorrelationOfTwoArrays
  def get_pearson(x_data, y_data)
    result=0
    x_data = x_data.flatten
    y_data = y_data.flatten
		return -1 if x_data.nil? || y_data.nil? || x_data.empty? || y_data.empty?
	
		x_sum=0
		y_sum=0
    x_data_sum = x_data.sum 
		y_data_sum = y_data.sum
    
		x_average = x_data_sum / x_data.length 
		y_average = y_data_sum / y_data.length
   
		x_tmp_sum=0
		y_tmp_sum=0

		x_sum_value = x_data.each {|v| 
      distracted = v - x_average
      x_tmp_sum += distracted**2
		}
    rooted_x = Math.sqrt(x_tmp_sum)

   y_sum_value = y_data.each {|v| 
      distracted = v - y_average
      y_tmp_sum += distracted**2
		}
    rooted_y = Math.sqrt(y_tmp_sum)

    bunmo = rooted_x * rooted_y

		bunza=0
		x_data.zip(y_data).each do |x, y|
			
        distracted_x = x - x_average
				distracted_y = y - y_average
        bunza += distracted_x * distracted_y
		end

    return result = (bunza / bunmo).to_f.round(4) >= 0 ? (bunza / bunmo).to_f.round(4) : -1
  end
  module_function :get_pearson
end
