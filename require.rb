require 'active_support/time'

require 'yaml'
require 'securerandom'

require './modules/common'
require './modules/data_manipulation'

include Common
include DataManipulation

require './entities/book'
require './entities/order'
require './entities/author'
require './entities/reader'
