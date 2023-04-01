class ReimbursementController < ApplicationController
  def show
    reimbursement = Reimbursement.all
    # render json: {message: 'reimbursement shown'}
    render json: reimbursement, status: :ok
  end

  def create
    reimbursement = Reimbursement.new(description: params[:description] ,amount: params[:amount])
    if reimbursement.save
        {status: [201, 'Created']}
    else
        json status: [400, 'Bad Request'], body: {reimbursement: 'Invalid list'}
    end
  end

  def destroy
    reimbursement = Reimbursement.find(params[:id])
    if reimbursement.present?
      reimbursement.delete
      render json: { message: 'Reimbursement deleted successfully' }, status: :ok
    else
      render json: { message: 'Error deleting reimbursement' }, status: :unprocessable_entity
    end
  end

  def update
    reimbursement = Reimbursement.find(params[:id])
    if reimbursement.present?
      reimbursement.update_attribute(:description, params[:description])
      reimbursement.update_attribute(:amount, params[:amount])
      render json: {message: "reimbursement updating"}, status: :ok
    else
      render json: {message: "reimbursement update failed"}, status: :error
    end
  end

  # def update
  #   if @user
  #     todo_list = TodoList.where(id: @request[:params]['id'], user_id: @user.id).first
  #     if todo_list
  #       todo_list.update(@request[:body])
  #       {status: [204, "No Content"], headers: cors}
  #     else
  #       json status: [404, "Not Found"], body: {message: 'Todo not found'}, headers: cors
  #     end
  #   else
  #     json status: [401, "Unauthorized"], body: {message: 'Invalid token'}, headers: cors
  #   end
  # end
end
