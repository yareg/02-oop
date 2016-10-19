# common functions
module Common
  def format_time(time = Time.current)
    time.strftime('%d/%m/%Y %H:%M:%S')
  end
end
