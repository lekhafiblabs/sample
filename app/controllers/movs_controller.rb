class MovsController < ApplicationController
  before_action :set_mov, only: [:show, :edit, :update, :destroy]
  before_action:authenticate_user!

  def index
    query = params[:query].present? ? params[:query] : nil
    @movs= if query
  
  
  Mov.search(where: { moviename:{ like: "%#{params[:query]}%"}}).to_a

    else
      Mov.all
    end
  end
  def autocomplete
    render json: Mov.search(params[:query], {
      fields: ["moviename^5"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:moviename)
  
  end

  # GET /movs/1
  # GET /movs/1.json
  def show
  end

  # GET /movs/new
  def new
    @mov = Mov.new
  end

  # GET /movs/1/edit
  def edit
  end

  # POST /movs
  # POST /movs.json
  def create
    @mov = Mov.new(mov_params)

    respond_to do |format|
      if @mov.save
       
        format.html { redirect_to @mov, notice: 'Mov was successfully created.' }
        format.json { render :show, status: :created, location: @mov }
      else
        format.html { render :new }
        format.json { render json: @mov.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movs/1
  # PATCH/PUT /movs/1.json
  def update
    respond_to do |format|
      if @mov.update(mov_params)

        format.html { redirect_to @mov, notice: 'Mov was successfully updated.' }
        format.json { render :show, status: :ok, location: @mov }
      else
        format.html { render :edit }
        format.json { render json: @mov.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movs/1
  # DELETE /movs/1.json
  def destroy
    @mov.destroy
    respond_to do |format|
      format.html { redirect_to movs_url, notice: 'Mov was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mov
      @mov = Mov.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mov_params
      params.require(:mov).permit(:moviename, :cast, :lang, :image)
    end
end
