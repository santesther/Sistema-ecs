class InstituicaosController < ApplicationController
  before_action :set_instituicao, only: %i[ show edit update destroy ]

  # GET /instituicaos or /instituicaos.json
  def index
    @instituicaos = Instituicao.all
  end

  # GET /instituicaos/1 or /instituicaos/1.json
  def show
  end

  # GET /instituicaos/new
  def new
    @instituicao = Instituicao.new
  end

  # GET /instituicaos/1/edit
  def edit
  end

  # POST /instituicaos or /instituicaos.json
  def create
    @instituicao = Instituicao.new(instituicao_params)

    respond_to do |format|
      if @instituicao.save
        format.html { redirect_to instituicao_url(@instituicao), notice: "Instituicao was successfully created." }
        format.json { render :show, status: :created, location: @instituicao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instituicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instituicaos/1 or /instituicaos/1.json
  def update
    respond_to do |format|
      if @instituicao.update(instituicao_params)
        format.html { redirect_to instituicao_url(@instituicao), notice: "Instituicao was successfully updated." }
        format.json { render :show, status: :ok, location: @instituicao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @instituicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instituicaos/1 or /instituicaos/1.json
  def destroy
    @instituicao.destroy

    respond_to do |format|
      format.html { redirect_to instituicaos_url, notice: "Instituicao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instituicao
      @instituicao = Instituicao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instituicao_params
      params.require(:instituicao).permit(:nome_da_instituicao, :cnpj, :endereco_da_instituicao, :numero_da_instituicao, :complemento_da_instituicao, :bairro_da_instituicao, :municipio_da_instituicao, :cep_da_instituicao, :telefone_da_instituicao, :representante, :user_id)
    end
end
