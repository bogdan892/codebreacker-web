# frozen_string_literal: true

class BaseController
  include Constants
  attr_accessor :path, :view_path, :app, :errors

  def initialize(path, view_path)
    @path = path
    @view_path = view_path
    @app = nil
    @errors = []
  end

  def response(app)
    @app = app
    @game = @app.session[:game]
    app.request_method == 'POST' ? check_post : render_page
  end

  def redirect(path)
    [301, { 'Location' => path }, ['']]
  end

  def render_page
    Rack::Response.new(render(@view_path), 200).finish
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
