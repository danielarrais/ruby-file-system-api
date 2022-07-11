class ArquivosController < ApplicationController
  before_action :set_arquivos_services, only: [:index, :show]

  def index
    sub_diretorios = parse_boolean(params[:sub_diretorios])
    @arquivos = @arquivos_service.buscar_todos(sub_diretorios)
    render json: @arquivos, status: :ok
  end

  def show
    sub_diretorios = parse_boolean(params[:sub_diretorios])
    @arquivo =  @arquivos_service.buscar(params[:id].to_i, sub_diretorios)
    render json: @arquivo, status: :ok
  end

  def new
  end

  def edit
  end

  private

  def set_arquivos_services
    @arquivos_service = ArquivosServices.new
  end

  def set_arquivo
    @arquivo = Arquivo.find(params[:id].to_i)
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e.message }, status: :not_found
  end

end
