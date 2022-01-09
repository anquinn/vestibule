# To deliver this notification:
#
# UpdateBankBalanceNotification.with(riding: @riding).deliver_later(current_user)
# UpdateBankBalanceNotification.with(riding: @riding).deliver(current_user)

class UpdateBankBalanceNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :riding

  # Define helper methods to make rendering easier.
  #
  def title
    t(".title")
  end

  def message
    t(".message", riding: params[:riding].name)
  end
  
  def url
    riding_path(params[:riding])
  end
end
