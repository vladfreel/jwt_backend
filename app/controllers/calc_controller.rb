class CalcController < ApplicationController
  skip_before_action :require_login
  def string_calculation
    res = calculating(params[:firstString],
                params[:secondString],
                params[:firstString].length,
                params[:secondString].length)
    render json: res
  end

  private

  def calculating(str1, str2, n, m)
    arr1 = str1.split('')
    res_arr1 = str1.split('')
    arr2 = str2.split('')
    s_index_1 = 0;
    i = 0;
    arr2.each do |char_2|
      arr1.each_with_index do |char_1, index|
        if char_2.eql? char_1
          next if index < s_index_1
          i += 1
          res_arr1[index] = '<u>' + res_arr1[index] + '</u>'
          s_index_1 = index += 1
          break
        end
      end
    end
    if i == arr2.length
      {cond: 'Yes', res: res_arr1.join('')}
    else
      {cond: 'No'}
    end
  end
end
