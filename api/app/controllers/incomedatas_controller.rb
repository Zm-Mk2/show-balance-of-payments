class IncomedatasController < ApplicationController
    def index
        incomedatas = Incomedata.where('date > ?', params[:beginym]).where('date <= ?', params[:endym])
        render json: incomedatas
    end

    def create
        incomedata = Incomedata.new(incomedata_params)
        if incomedata.save
            render json: incomedata
        else
            render json: incomedata.errors, status: 422
        end
    end

    private
    def incomedata_params
        params.require(:incomedata).permit(:date, :content, :amount, :litem, :mitem)
    end
end
