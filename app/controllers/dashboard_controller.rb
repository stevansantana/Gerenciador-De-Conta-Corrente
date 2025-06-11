class DashboardController < ApplicationController
  before_action :verificar_autenticacao
  before_action :set_correntista, only: [
  :menu, :saldo, :extrato, :deposito, :saque, 
  :realizar_saque, :realizar_deposito, :transferencia, 
  :realizar_transferencia, :confirmar_visita
]

  def menu
  end

  def saldo
  end

  def extrato
    @transacoes = @correntista.transacoes.order(created_at: :desc)
  end

  def deposito
  end

  def saque
  end

  def realizar_saque
    valor = params[:valor].to_f

    begin
      @correntista.sacar!(valor)
      flash[:notice] = "Saque de R$ #{'%.2f' % valor} realizado com sucesso"
      redirect_to menu_path
    rescue => e
      flash.now[:alert] = e.message
      render :saque
    end
  end

  def realizar_deposito
    valor = params[:valor].to_f

    begin
      @correntista.depositar!(valor)
      flash[:notice] = "Depósito de R$ #{'%.2f' % valor} realizado com sucesso"
      redirect_to menu_path
    rescue => e
      flash.now[:alert] = e.message
      render :deposito
    end
  end

  def transferencia
  end

  def realizar_transferencia
    destino = Correntista.find_by(conta_corrente: params[:conta_destino])
    valor = params[:valor].to_f
  
    begin
      TransferenciaService.new(origem: @correntista, destino: destino, valor: valor).executar!
      flash[:notice] = "Transferência de R$ #{'%.2f' % valor} realizada com sucesso."
      redirect_to menu_path
    rescue => e
      flash[:alert] = e.message # Alterado de flash.now[:alert] para flash[:alert]
      redirect_to transferencia_path # Redireciona de volta para a página de transferência
    end
  end

  def visita_gerente
  end

  def confirmar_visita
    begin
      @correntista.solicitar_visita!
      redirect_to menu_path, notice: "Visita do gerente solicitada com sucesso. R$ 50,00 debitado."
    rescue => e
      redirect_to menu_path, alert: e.message
    end
  end

  private

  def set_correntista
    @correntista = correntista_atual
  end

  def correntista_atual
    @correntista ||= Correntista.find(session[:correntista_id])
  end

  def verificar_autenticacao
    redirect_to login_path unless session[:correntista_id]
  end
end
