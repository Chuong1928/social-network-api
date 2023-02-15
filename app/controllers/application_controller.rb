class ApplicationController < ActionController::API

  rescue_from Exception, with: :render500
  rescue_from ActionController::BadRequest, with: :render400
  rescue_from ActiveRecord::RecordNotFound, with: :render404
  rescue_from ActiveRecord::RecordInvalid, with: :render422

  private
  def render400(exception = nil)
    render_error(400, "Bad Request", exception&.message)
  end

  def render404(exception = nil)
    render_error(404, "Not Found", exception&.message)
  end

  def render422(exception = nil)
    render_error(422, "Unprocessable Entity", exception&.message)
  end
  
  def render500(exception = nil)
    render_error(500, "Internal Server Error", exception&.message)
  end

  def render_error(code, message, *error_messages)
    response = {
      message: message,
      errors: error_messages.compact
    }
    render json: response, status: code
  end

end
