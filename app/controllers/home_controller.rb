class HomeController < ApplicationController
    def index
        render text: "myApp is here"
    end
    def paramTest
        render text: "Param1:  "+params[:firstname]+"    Params2:"+params[:lastname]
    end
end
