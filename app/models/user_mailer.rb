class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Пожалуйста, активируйте свой аккаунт'
  
    @body[:url]  = "http://planetasmile.ru/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Вы успешно активировали свой аккаунт!'
    @body[:url]  = "http://planetasmile.ru/"
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "noreplay@planetasmile.ru"
      @subject     = "planetasmile.ru "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
