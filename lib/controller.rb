class Controller

  attr_reader :name, :action
  attr_accessor :status, :headers, :content

  def initialize(name: nil, action: nil)
    @name =  name
    @action = action
  end

  def call
    send(action)
    self.status = 200
    self.headers = { "Content-Type" => "text/plain" }
    self.content = [template.render(self)]
    self
  end

  def not_fount
    self.status = 404
    self.headers = {}
    self.content = ['Nothing Found']
    self
  end

  def internal_error
    self.status = 500
    self.headers = {}
    self.content = ['Internal Server Error']
    self
  end

  def template
    Slim::Template.new(File.join(App.root, 'app', 'views', "#{self.name}", "#{self.action}.slim"))
  end

end