defmodule WorkingTimeManager.Utils.DateTimeHelper do
    
    def format(dateTime) do
        str = DateTime.to_string(dateTime)
        String.slice(str, 0..-2)
    end

  end
  