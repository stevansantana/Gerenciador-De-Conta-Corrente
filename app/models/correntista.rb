  class Correntista < ApplicationRecord
    has_many :transacoes, dependent: :destroy, class_name: "Transacao"
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

    def saldo_com_taxas
      return saldo unless perfil == "VIP" && saldo < 0

      minutos_desde_ultima_atualizacao = ((Time.current - updated_at) / 60).round
      return saldo if minutos_desde_ultima_atualizacao <= 0

      # Calcula a redução acumulada
      reducao_acumulada = saldo.abs * (1 - (0.999 ** minutos_desde_ultima_atualizacao))

      # Atualiza o saldo se houver redução a aplicar
      if reducao_acumulada > 0
        novo_saldo = saldo - reducao_acumulada
        update_columns(saldo: novo_saldo, updated_at: Time.current)

        if minutos_desde_ultima_atualizacao == 1
          transacoes.create!(
          tipo: "TAXA_VIP",
          valor: -reducao_acumulada,
          descricao: "Taxa VIP (0.1% ao minuto) aplicada por #{minutos_desde_ultima_atualizacao} minuto"
        ) else
        transacoes.create!(
          tipo: "TAXA_VIP",
          valor: -reducao_acumulada,
          descricao: "Taxa VIP (0.1% ao minuto) aplicada por #{minutos_desde_ultima_atualizacao} minutos")
        end
      end

      novo_saldo
    end
  end
