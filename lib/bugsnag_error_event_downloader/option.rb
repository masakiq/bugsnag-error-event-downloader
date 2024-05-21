# typed: strict
# frozen_string_literal: true

module BugsnagErrorEventDownloader
  class Option
    extend T::Sig

    sig { returns(T::Hash[Symbol, T.any(String, T::Boolean)]) }
    attr_reader :option

    sig { params(args: T::Array[String]).void }
    def initialize(args = ARGV)
      @option = T.let({}, T::Hash[Symbol, T.any(String, T::Boolean)])
      args_tmp = args.dup
      args_tmp.each.with_index do |arg, i|
        if arg == "-t"
          @option[:token] = args_tmp[i + 1]
        else
          arg.start_with?("--token=")
          @option[:token] = arg.sub("--token=", "")
        end
      end
    end

    sig { params(name: Symbol).returns(T::Boolean) }
    def has?(name)
      option.include?(name)
    end

    sig { params(name: Symbol).returns(T.untyped) }
    def get(name)
      option[name]
    end
  end
end
