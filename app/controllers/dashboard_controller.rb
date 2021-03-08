class DashboardController < ApplicationController
  def index; end

  def upload_csv
    if Dashboard::UploadCsv.call(params[:data])
      redirect_to root_path, alert: 'Dados importados com sucesso!!'
    else
      redirect_to root_path, alert: 'Erro ao importar dados!!'
    end
  end
end