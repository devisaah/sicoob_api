# frozen_string_literal: true

require 'rubygems'
require 'active_model'
require 'active_support/time'
require 'json'

require_relative "sicoob_api/version"
require_relative "sicoob_api/configure"

module SicoobApi
  class Error < StandardError; end
  # Your code goes here...
  extend SicoobApi::Configure
end
