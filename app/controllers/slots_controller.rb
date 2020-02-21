class SlotsController < ApplicationController
  before_action:authenticate_user!
  before_action :set_slot, only: [:show, :edit, :update, :destroy]
  

  # GET /slots
  # GET /slots.json
  def index
    @slot = Slot.new
    @slots = Slot.all

    @mov_id = params[:mov_id]
  end

  # GET /slots/1
  # GET /slots/1.json
  def show

  end
  def book_user
    @userr=User.find(current_user.id)
    booking = Booking.new
    user = User.find(current_user.id)
    slot = Slot.find(params[:slot_id])
    mov = Mov.find(params[:mov_id])
    booking.user = user
    booking.slot = slot
    booking.mov = mov
    
   if booking.save
   
    UserMailer.delay(:run_at =>slot.timings-1.hour).welcome_email(@userr)
  
  

    redirect_to booking
   end
 
   
  end
  # GET /slots/new
  def new
    @slot = Slot.new
    @mov_id = params[:mov_id]
    
  end

  # GET /slots/1/edit
  def edit
  end

  # POST /slots
  # POST /slots.json
  def create

timings=slot_params.except('mov_id')
@mov_id=slot_params['mov_id']
    @slot = Slot.new(timings)




    respond_to do |format|
      if @slot.save
        
        format.html { redirect_to book_user_path(:slot_id => @slot.id,:user_id => @user_id, :mov_id=>@mov_id), notice: 'Slot was successfully created.' }
        format.json { render :show, status: :created, location: @slot }


      else
        format.html { render :new }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slots/1
  # PATCH/PUT /slots/1.json
  def update
    respond_to do |format|
      if @slot.update(slot_params)
        format.html { redirect_to @slot, notice: 'Slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @slot }
      else
        format.html { render :edit }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slots/1
  # DELETE /slots/1.json
  def destroy
    @slot.destroy
    respond_to do |format|
      format.html { redirect_to slots_url, notice: 'Slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slot
      @slot = Slot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
  
    def slot_params
    
  params.require(:slot).permit(:timings,:mov_id)
  # @hello= params.require(:slot).permit(:mov_id)


     
     
    end
end
