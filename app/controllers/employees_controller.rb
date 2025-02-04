class EmployeesController < ApplicationController

before_action :current_employee, only:[:show, :edit, :update]

def index
    @employees = Employee.all 
end 

def show
end

def new 
    @employee = Employee.new
    @dogs = Dog.all
end

def create 
    # byebug
    # employees_params[:dog] = 3
    @employee = Employee.create(employees_params)
  
    if @employee.valid?
        @employee.save 
        redirect_to employee_path(@employee)
    else
        flash[:errors] = @employee.errors.full_messages 
        redirect_to new_employee_path
    end
end 

def edit
    # @employees = Employee.all
    @dogs = Dog.all
end

def update 
    @employee.update(employees_params)
    redirect_to employee_path(@employee)
end 




private


def current_employee
    @employee = Employee.find(params[:id])
end


def employees_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
end 

end
