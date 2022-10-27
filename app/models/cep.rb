require 'net/http'

class Cep

  attr_reader :logradouro, :bairro, :localidade, :uf

  HOST = ("https://viacep.com.br/ws/")
  FORMAT = "/json/"

  def initialize(cep_string)
    cep_encontrado = encontrar(cep_string)
    preencher_dados(cep_encontrado)
  end

  def endereco
    "#{@logradouro} / #{@bairro} / #{@localidade} / #{@uf}"
  end

  private

    def encontrar(cep_string)
      ActiveSupport::JSON.decode(
        Net::HTTP.get(
          URI("#{HOST}#{cep_string}#{FORMAT}")
        )
      )
    end

    def preencher_dados(cep_encontrado)
      @logradouro = cep_encontrado["logradouro"]
      @bairro = cep_encontrado["bairro"]
      @localidade = cep_encontrado["localidade"]
      @uf = cep_encontrado["uf"]
    end

end