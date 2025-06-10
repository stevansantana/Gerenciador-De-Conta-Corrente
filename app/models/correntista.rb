  class Correntista < ApplicationRecord
    has_many :transacoes, class_name: "Transacao"
    has_many :visitas_gerente, class_name: "VisitaGerente"

    def pode_sacar?(valor)
      valor > 0 && (perfil != "Normal" || saldo >= valor)
    end

    def sacar!(valor)
      raise "Valor inválido para saque." if valor <= 0
      raise "Saldo insuficiente." if perfil == "Normal" && valor > saldo

      update!(saldo: saldo - valor)

      transacoes.create!(
        tipo: "Saque",
        descricao: "Saque realizado",
        valor: -valor
      )
    end

    def depositar!(valor)
      raise "Valor inválido para depósito." if valor <= 0

      update!(saldo: saldo + valor)

      transacoes.create!(
        tipo: "Depósito",
        descricao: "Depósito realizado",
        valor: valor
      )
    end

    def solicitar_visita!
      raise "Apenas usuários VIP podem solicitar visita." unless perfil == "VIP"
      raise "Saldo insuficiente para solicitar visita." if saldo < 50

      update!(saldo: saldo - 50)

      transacoes.create!(
        tipo: "Serviço",
        descricao: "Solicitação de visita do gerente",
        valor: -50
      )

      visitas_gerente.create!(confirmado: true)
    end
  end
