class CalcController < ApplicationController
  skip_before_action :require_login
  def string_calculation
    res = calculating(params[:firstString],
                params[:secondString],
                params[:firstString].length,
                params[:secondString].length)
    render json: {res: res}
  end

  private

  def calculating(str1, str2, n, m)
    j = 0;
    i = 0;
    while i<n and j<m
      p str1[j] 
      p str2[i]
      p '*'*100
      if str1[j] == str2[i]
        j += 1 
      end
      i += 1
    end
    p j
    p m
  end
end
#https://www.geeksforgeeks.org/given-two-strings-find-first-string-subsequence-second/