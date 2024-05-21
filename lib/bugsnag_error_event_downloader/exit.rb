# typed: strict
# frozen_string_literal: true

module BugsnagErrorEventDownloader
  class Exit
    class << self
      extend T::Sig

      sig { params(status: Integer).void }
      def run(status:)
        exit(status)
      end
    end
  end
end
