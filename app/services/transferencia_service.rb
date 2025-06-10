class TransferenciaService
  def initialize(origem:, destino:, valor:)
    @origem = origem
    @destino = destino
    @valor = valor
  end

  def executar!
    raise "Conta destino inválida." if @destino.nil? || @origem.id == @destino.id
    raise "Valor inválido para transferência." if @valor <= 0

    taxa = calcular_taxa
    total = @valor + taxa

    raise "Saldo insuficiente." if @origem.saldo < total

    ActiveRecord::Base.transaction do
      @origem.update!(saldo: @origem.saldo - total)
      @destino.update!(saldo: @destino.saldo + @valor)

      @origem.transacoes.create!(tipo: "Transferência", descricao: "Para conta #{@destino.conta_corrente}", valor: -@valor)
      @origem.transacoes.create!(tipo: "Taxa", descricao: "Taxa de transferência", valor: -taxa)
      @destino.transacoes.create!(tipo: "Transferência", descricao: "Recebido de #{@origem.conta_corrente}", valor: @valor)
    end
  end

  private

  def calcular_taxa
    case @origem.perfil
    when "Normal"
      raise "Usuários Normais só podem transferir até R$1000." if @valor > 1000
      8.00
    when "VIP"
      @valor * 0.008
    else
      0
    end
  end
end
