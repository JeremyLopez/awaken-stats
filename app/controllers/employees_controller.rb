class EmployeesController < ApplicationController
	before_action :set_location, except: [:employees, :assign_manager, :toggle_fire_employee]
  before_action :set_employee, only: [:toggle_fire_employee, :assign_manager, :show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = @location.employees.all.order("manager DESC")
  end
	
	def assign_manager
		@current_manager = @employee.location.employees.where(manager: true).first
		if @employee.manager == true
			@employee.update_column(:manager, false)
		elsif @current_manager.present? && @employee.manager == false
			@current_manager.update_column(:manager, false)
			@employee.update_column(:manager, true)
			@current_manager.save
		else
			@employee.update_column(:manager, true)
		end
		@employee.save
		redirect_to location_employees_path(@employee.location)
	end
	
	def toggle_fire_employee
		if @employee.terminated?
			@employee.update_column(:terminated, false)
		else
			@employee.update_column(:terminated, true)
		end
		@employee.save
		redirect_to location_employees_path(@employee.location)
	end
	
	def employees
		@locations = Location.all
		@staff = Employee.getEmployees(@locations)
#		@staff.each do |k, v|
#			v.order("manager DESC")
#			puts "HERE"
#			puts v.inspect
#		end
	end

  # GET /employees/1
  # GET /employees/1.json
  def show
		@timecards = @employee.timecards
  end

  # GET /employees/new
  def new
    @employee = Employee.new
#		@location = Location.find(params[:location_id])
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
#		@location = Location.find(params[:location_id])
    @employee = Employee.new(employee_params)
		@employee.location_id = @location.id

    respond_to do |format|
      if @employee.save
        format.html { redirect_to location_path(@location), notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to location_employee_path(@location, @employee), notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to location_path(@location), notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.friendly.find(params[:id])
    end
	
		def set_location
      @location = Location.friendly.find(params[:location_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :phone, :email, :location_id, :manager, :user_id)
    end
end
