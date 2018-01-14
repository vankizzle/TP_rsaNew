require 'openssl'

class DecryptMessagesController < ApplicationController
  before_action :set_rsa
  # before_action :set_message, only: :show

  def create
    key = OpenSSL::PKey::RSA.new 2048
    # key.set_key(@rsa.n.to_i, @rsa.e.to_i, @rsa.d.to_i)
    key.n = @rsa.n.to_i
    key.e = @rsa.e.to_i
    key.d = @rsa.d.to_i

    decoded = Base64.decode64(params[:message])
    decrypted = key.private_decrypt(decoded)
    @message = @rsa.messages.create(content: decrypted)
    respond_to do |format|
      format.json { render json: @message.to_json(only: [:content]), status: :created }
    end
  end

  private

  def set_rsa
    @rsa = Rsa.find params[:rsa_id]
  end

  # def set_message
  #   @message = @rsa.messages.find params[:id]
  # end
end
