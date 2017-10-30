class Controller

  attr_reader :name, :action
  attr_accessor :status, :headers, :content

  def initialize(name: nil, action:nil)
    @name =  name
    @action = action
  end

  def call(env)
    env.status = 200
    env.headers = {'Content-Type' => 'text/plain'}
    env.content = ['Some Content here']
  end

  def not_fount(env)
    env.status = 404
    env.headers = {}
    env.content = ['Nothing Found']
  end

  def internal_error(env)
    env.status = 500
    env.headers = {}
    env.content = ['Internal Server Error']
  end

end