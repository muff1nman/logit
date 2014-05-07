# http://stackoverflow.com/questions/917566/ruby-share-logger-instance-among-module-classes

require 'logger'

module Logit
	VERSION = "0.0.1"

	class Formatter
		Format = "%s, [%s#%d] %5s -- %s: %s\n"
		CLEAR = "\e[0m"
		START_COLOR = "\e["
		END_COLOR = "m"

		module Colors
			BLACK        = '0;30'
			RED          = '0;31'
			GREEN        = '0;32'
			YELLOW       = '0;33'
			BLUE         = '0;34'
			MAGENTA      = '0;35'
			CYAN         = '0;36'
			GRAY         = '0;37'
		end

		LEVEL = {
			'DEBUG'=>   Colors::CYAN,
			'INFO'=>    Colors::BLUE,
			'WARN'=>    Colors::YELLOW,
			'ERROR'=>   Colors::RED,
			'FATAL'=>   Colors::MAGENTA,
			'UNKNOWN'=> Colors::BLACK
		}

		attr_accessor :datetime_format

		def initialize
			@datetime_format = nil
		end

		def call(severity, time, progname, msg)
			Format % [severity[0..0], format_datetime(time), $$, colorize_severity(severity), progname,
						 msg2str(msg)]
		end

		protected

		def colorize_severity severity
			"#{START_COLOR}%s#{END_COLOR}%s#{CLEAR}" % [LEVEL[severity], severity]
		end

		def format_datetime(time)
			if @datetime_format.nil?
				time.strftime("%Y-%m-%dT%H:%M:%S.") << "%06d " % time.usec
			else
				time.strftime(@datetime_format)
			end
		end

		def msg2str(msg)
			case msg
			when ::String
				msg
			when ::Exception
				"#{ msg.message } (#{ msg.class })\n" <<
				(msg.backtrace || []).join("\n")
			else
				msg.inspect
			end
		end
	end

	def logger
		@logger ||= Logging.logger_for(self.class.name)
	end

	# Use a hash class-ivar to cache a unique Logger per class:
	@loggers = {}

	class << self
		def logger_for(classname)
			@loggers[classname] ||= configure_logger_for(classname)
		end

		def configure_logger_for(classname)
			logger = Logger.new(STDOUT)
			logger.progname = classname
			logger.formatter = Formatter.new
			logger
		end
	end
end




