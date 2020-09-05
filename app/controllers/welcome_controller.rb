class WelcomeController < ApplicationController
    before_action :authorize!, only: [:admin]

    def home 
    end

# This looks for a views/controller_name/method_name.html.erb. In this case, views/welcome/home.html.erb

    def about
    end

# This looks for a views/controller_name/method_name.html.erb. In this case, views/welcome/about.html.erb

    def contact_us
    end


    def process_contact
        # inside of all controller actions you have access a `request` object that represents the request being made
        # In rails all the information from the url and body are in a hash called `params`
        # storing values inside of instance variables will give you access to them inside of your views
        @full_name = params[:full_name]
        @email = params[:email]
        @message = params[:message]
    
        render :thank_you
      end
    
    def bill_spliter
    end

    def process_bill

        @amount = params[:amount].to_f
        @tax = params[:tax].to_f
        @tip = params[:tip].to_f
        @number_of_people = params[:number_of_people].to_f

        multiply = (@tax + @tip) / 100 + 1 

        @split = (@amount * multiply / @number_of_people).round(2)

        render :bill_split

    end

    def admin
    end
    
    def authorize! 
        redirect_to products_path, alert: 'Not Authorized' unless current_user && current_user.is_admin
    end
end
