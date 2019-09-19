defmodule WorkingTimeManager.Utils.DateTimeHelper do
    
    def format(dateTime) do
        str = DateTime.to_string(dateTime)
        String.slice(str, 0..-2)
    end

    def parse(datestring) do
        {:ok, date,   _} = DateTime.from_iso8601(datestring <> "+00:00")
        date
    end

  end
  