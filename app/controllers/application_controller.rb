class ApplicationController < ActionController::API

  def issue_token(payload)
    JWT.encode(payload, 'secret')
  end

  def decode(token)
    JWT.decode(token, 'secret')
  end


end
