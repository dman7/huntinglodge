class HomeController < ActionController::Base
  
  def hello
    to_say = params[:query].to_s

    if to_say.length > 0
      if %x(which 'say').length > 0
        %x(say #{to_say})
      elsif %x(which 'espeak').length > 0
        %x(echo "#{to_say}" | espeak)
      end
    end

    render :json => :ok, :status => 200
  end
end
