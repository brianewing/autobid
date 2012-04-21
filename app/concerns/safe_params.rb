module SafeParams
  extend ActiveSupport::Concern

  module ClassMethods
    attr_accessor :safe_params

    def safe(thing, *params)
      self.safe_params ||= {}
      self.safe_params[thing] = params
    end
  end

  def safe_params(thing = nil)
    thing ||= self.class.safe_params.keys.first
    params[thing].slice *self.class.safe_params[thing]
  end
end
