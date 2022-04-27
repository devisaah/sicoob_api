# frozen_string_literal: true

module SicoobApi 
	module Configure

		# Endereço do WSDL:
		API_BOLETO_AUTENTICACAO_URL = {
			:homologacao => "https://sandbox.sicoob.com.br",
			:producao => "https://api.sisbr.com.br/auth"
		}
		
		API_BOLETO_URL = {
			:homologacao => "https://sandbox.sicoob.com.br",
			:producao => "https://api.sisbr.com.br/cooperado"
		}

		# Parâmetros iniciais
		AMBIENTE = :homologacao
		# Parâmetros iniciais
		API_VERSION = '3'
		# Parâmetros iniciais
		CLIENT_ID = 'C8ESRxF7Ze59so7QojIYPxRtmWAa'
		# Parâmetros iniciais
		CLIENT_SECRET = 'C8ESRxF7Ze59so7QojIYPxRtmWAa'
		# Parâmetros iniciais
		TOKEN_BASIC = 'QzhFU1J4RjdaZTU5c283UW9qSVlQeFJ0bVdBYTpheXZ2QVB0SVRVaWEwWWpwRE5QUFhueHo4b1Vh'
		# Parâmetros iniciais
		SCOPE = 'cobranca_boletos_consultar+cobranca_boletos_incluir+cobranca_boletos_pagador+cobranca_boletos_segunda_via+cobranca_boletos_descontos+cobranca_boletos_abatimentos+cobranca_boletos_valor_nominal+cobranca_boletos_seu_numero+cobranca_boletos_especie_documento+cobranca_boletos_baixa+cobranca_boletos_rateio_credito+cobranca_pagadores+cobranca_boletos_negativacoes_incluir+cobranca_boletos_negativacoes_alterar+cobranca_boletos_negativacoes_baixar+cobranca_boletos_protestos_incluir+cobranca_boletos_protestos_alterar+cobranca_boletos_protestos_desistir+cobranca_boletos_solicitacao_movimentacao_incluir+cobranca_boletos_solicitacao_movimentacao_consultar+cobranca_boletos_solicitacao_movimentacao_download+cob+covb+lotecobv+pix+webhook+palyloadlocation+cobranca_boletos_prorrogacoes_data_vencimento+cobranca_boletos_prorrogacoes_data_limite_pagamento'
		# Parâmetros iniciais
		COOPERATIVA = 0001
		# Parâmetros iniciais
		CHAVE_ACESSO = SD0002
		# Parâmetros iniciais
		PASSWORD = 12345678

		# Define o ambiente de trabalho
		# Símbolo - Valores pré-definidos [:homologacao, :producao]
		attr_writer :ambiente

	 	# Enviado pela Sicoob
    	attr_writer :api_version

	    # Enviado pela Sicoob
	    attr_writer :token_basic

	    # Enviado pela Sicoob
	    attr_writer :client_id

	    # Enviado pela Sicoob
	    attr_writer :client_secret

	    # Enviado pela Sicoob 
	    attr_writer :scope 

	    # Enviado pela Sicoob
	    attr_writer :cooperativa

	    # Enviado pela Sicoob 
	    attr_writer :chave_acesso

	    # Enviado pela Sicoob
	    attr_writer :PASSWORD

	    # Token de acesso utilizado nas demais requisições
	    attr_writer :expires_in
	    attr_writer :token_type
	    attr_writer :access_token
	    attr_writer :refresh_token

	    # Comando que recebe as configurações
	    def configure
	    	yield self if block_given?
	    end

	    # Definir ambiente 
	    def ambiente
	    	@ambiente ||= AMBIENTE
	    end

	    # Definir a versão da API Sicoob
	    def api_version
	    	@api_version ||= API_VERSION
	    end

	    # Definir client_id
	    def client_id
	    	@client_id ||= CLIENT_ID
	    end

	    # Definir client_secret
	    def client_secret
	    	@client_secret ||= CLIENT_SECRET
	    end

	     # Definir token_basic
	    def token_basic
	    	@token_basic ||= TOKEN_BASIC
	    end

	     # Definir scope
	    def scope
	    	@scope ||= scope
	    end

	    # Definir cooperativa
	    def cooperativa
	    	@cooperativa ||= COOPERATIVA
	    end

        # Definir chave_acesso
	    def chave_acesso
	    	@chave_acesso ||= CHAVE_ACESSO
	    end

	    # Definir password
	    def password
	    	@password ||= PASSWORD
	    end

	    # Definir endpoint de autenticação
	    def endpoint_auth
	    	@endpoint_auth ||= set_endpoint_auth
	    end

	    # Definir endpoint geral
	    def endpoint
      		@endpoint ||= set_endpoint
    	end

	    # Definir access_token
	    def access_token
	      @access_token ||= ""
	    end

	    # Definir refresh_token
	    def access_token
	      @refresh_token ||= ""
	    end

	    # Definir token_type
	   	def token_type
	   		@token_type ||= ""
	   	end

	    # Definir o tempo de expiração do token
	    def expires_in
	      @expires_in ||= DateTime.now - 1.day
	    end

	    # Retornar a url conforme o ambiente (AUTENTICAÇÃO)
	    def set_endpoint_auth
	      if ambiente == :producao
	        return SicoobApi::Configure::API_BOLETO_AUTENTICACAO_URL[:producao]
	      else
	        return SicoobApi::Configure::API_BOLETO_AUTENTICACAO_URL[:homologacao]
	      end
	    end

	    # Retornar a url conforme o ambiente (GERAL)
	    def set_endpoint
	      if ambiente == :producao
	        return SicoobApi::Configure::API_BOLETO_URL[:producao]
	      else
	        return SicoobApi::Configure::API_BOLETO_URL[:homologacao]
	      end
	    end

	    def base_uri
	      return "#{self.endpoint}"
	    end
	end

end