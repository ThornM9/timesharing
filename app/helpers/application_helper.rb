module ApplicationHelper
  def index_to_time(index)
    if index < 48 && index > -1
      time = "" + (index/2).to_s + ":"
        if (index%2) == 1
          time = time + "30"
        elsif (index%2) == 0
          time = time + "00"
        end
    else
      "Index is invalid"
    end
  end
end
