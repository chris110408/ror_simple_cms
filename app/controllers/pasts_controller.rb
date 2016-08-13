class PastsController < ApplicationController
  before_action :set_past, only: [:show, :edit, :update, :destroy]

  # GET /pasts
  # GET /pasts.json
  def index
    @pasts = Past.all
  end

  # GET /pasts/1
  # GET /pasts/1.json
  def show
  end

  # GET /pasts/new
  def new
    @past = Past.new
  end

  # GET /pasts/1/edit
  def edit
  end

  # POST /pasts
  # POST /pasts.json
  def create
    @past = Past.new(past_params)

    respond_to do |format|
      if @past.save
        format.html { redirect_to @past, notice: 'Past was successfully created.' }
        format.json { render :show, status: :created, location: @past }
      else
        format.html { render :new }
        format.json { render json: @past.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pasts/1
  # PATCH/PUT /pasts/1.json
  def update
    respond_to do |format|
      if @past.update(past_params)
        format.html { redirect_to @past, notice: 'Past was successfully updated.' }
        format.json { render :show, status: :ok, location: @past }
      else
        format.html { render :edit }
        format.json { render json: @past.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pasts/1
  # DELETE /pasts/1.json
  def destroy
    @past.destroy
    respond_to do |format|
      format.html { redirect_to pasts_url, notice: 'Past was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_past
      @past = Past.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def past_params
      params.fetch(:past, {})
    end
end
