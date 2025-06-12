Rails.application.routes.draw do
  root "sessions#new"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  get "/menu",  to: "dashboard#menu"
  get "/saldo", to: "dashboard#saldo"
  get "/extrato", to: "dashboard#extrato"

  get  "/saque", to: "dashboard#saque"
  post "/saque", to: "dashboard#realizar_saque"

  get  "/deposito", to: "dashboard#deposito"
  post "/deposito", to: "dashboard#realizar_deposito"

  get  "/transferencia", to: "dashboard#transferencia"
  post "/transferencia", to: "dashboard#realizar_transferencia"

  get  "/visita", to: "dashboard#visita"
  post "/visita_confirma", to: "dashboard#confirmar_visita"
end
