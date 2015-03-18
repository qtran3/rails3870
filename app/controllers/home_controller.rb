class HomeController < ApplicationController
    def index
        
        render text: "Welcome myApp is here"
    end
    def paramtest
        render text: "Param1:  "+params[:firstname]+"    Params2:"+params[:lastname]
    end
end
