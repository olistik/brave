require "brave/version"

module Brave

  def self.be(exception_classes = [NoMethodError])
    begin
      yield
    rescue *exception_classes => e
    end
  end

end
