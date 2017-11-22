class Service

  attr_accessor :params

  def initialize(params = {})
    params.each { |key,value| instance_variable_set("@#{key}", value) }
    instance_variables.each {|var| self.class.send(:attr_accessor, var.to_s.delete('@'))}
  end

  def to_s
    instance_variables.inject("") {|vars, var| vars += "#{var}: #{instance_variable_get(var)}; "}
  end

end