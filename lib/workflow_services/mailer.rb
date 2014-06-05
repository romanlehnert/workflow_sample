class Mailer

  # called by Workflow#execute_transition
  def execute(params = {})
    template = params[:template] || default_template
    receiver = params[:receiver]
    mail = SystemMailer.new(receiver: subject.email_recipient_for(receiver), body: EmailTemplate.find(template))
    mail.deliver!
  end

end
