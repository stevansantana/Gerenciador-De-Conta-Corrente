class SessionsController < ApplicationController
  def new
  end

  def create
    correntista = Correntista.find_by(conta_corrente: params[:conta_corrente])

    if correntista && correntista.senha == params[:senha]
      session[:correntista_id] = correntista.id
      redirect_to menu_path
    else
      flash[:alert] = "Conta ou senha inválida"
      render :new
    end
  end

  def destroy
    session[:correntista_id] = nil
    redirect_to login_path, notice: "Você saiu da conta."
  end
end
