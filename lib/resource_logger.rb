require 'logger'
# This class is needed so our logs will have timestamp info.
class ResourceLogger < Logger
  def format_message(severity, time, progname, msg)
    "%s| %s | %s: %s\n" % [time.strftime("%Y-%m-%d %H:%M:%S"),severity,Process.pid, msg]
  end
end

# This logger allows us to log messages no matter how we are called.
$RESOURCE_LOGGER = ResourceLogger.new(Rails.root.join('log', 'resource.log').to_s)
$RESOURCE_LOGGER.level = Logger::INFO
