# encoding: UTF-8

%w[
  logger
  fiber
  fileutils
  json

  ../lib/value/log

  ../lib/value/version
  ../lib/value/specification
  ../lib/value/config
  ../lib/value/value_source
  ../lib/value/priority_queue

  ../lib/value/source/base_value_source
  ../lib/value/source/static_value_source
  ../lib/value/source/guid_value_source

  ../lib/value/controller/base_controller
  ../lib/value/controller/static_value_controller
].each {|f| require f }

module Value
  class Forbidden < StandardError; end
end
