module FilterLogging

import Logging: AbstractLogger, LogLevel, shouldlog, handle_message, min_enabled_level, catch_exceptions
export FilterLogger

struct FilterLogger{T <:AbstractLogger} <: AbstractLogger
    logger::T
    level::LogLevel
end

min_enabled_level(logger::FilterLogger) = logger.level

shouldlog(logger::FilterLogger, args...) = shouldlog(logger.logger, args...)
handle_message(logger::FilterLogger, args...; kwargs...) = handle_message(logger.logger, args...; kwargs...)
catch_exceptions(logger::FilterLogger) = catch_exceptions(logger.logger)

end
