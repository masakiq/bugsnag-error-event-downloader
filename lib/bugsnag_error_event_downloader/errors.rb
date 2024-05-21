# typed: strict
# frozen_string_literal: true

module BugsnagErrorEventDownloader
  class NoAuthTokenError < StandardError; end

  class ValidationError < StandardError
    extend T::Sig

    sig { returns(T::Array[String]) }
    attr_reader :attributes

    sig { params(message: T.nilable(String), attributes: T::Array[String]).void }
    def initialize(message: nil, attributes: [])
      @attributes = attributes
      super(message)
    end
  end
end
