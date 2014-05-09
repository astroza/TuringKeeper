class DoCheckController < ApplicationController
  def create
    identifier = params['identifier']
    password = params['password']
    user = TuringUser.where(:identifier => identifier, :password => password).first
    if user != nil
      ret = CheckIn.where(:turing_user_id => user.id, :check_out_id => nil)
      if ret.count > 0
        response = {result: "checkout", first_name: user.FirstName}
        checkout = CheckOut.create(:turing_user_id => user.id)
        checkin = ret.first
        checkin.check_out_id = checkout.id
        checkin.save
      else
        CheckIn.create(:turing_user_id => user.id, :reason => params['reason'])
        response = {result: "checkin", first_name: user.FirstName}
      end
    else
      response = {result: "error"}
    end
    render json: response
  end
end
