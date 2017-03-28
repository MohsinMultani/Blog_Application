class UserMailer < Devise::Mailer  

  default from: "railcast@example.com"

  helper :application # gives access to all helpers defined within `application_helper`.
  
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def blog_notification(blog)
    @blog = blog

    mail to: @blog.user.email, sunject: "blog created successfully..!"
  end


end