class IncomedatasController < ApplicationController
    def index
        incomedatas = Incomedata.where('date > ?', params[:beginym]).where('date <= ?', params[:endym])
            .group("to_char(date, 'yyyy/mm')", 'litem')
            .select("to_char(date, 'yyyy/mm') as yearmonth", "sum(amount) as amounts", 'litem')
            .order('yearmonth', 'amounts', 'litem')
            .to_json(except: :id)
        render json: incomedatas
    end

    def destroy_all
        if Incomedata.where('date > ?', params[:beginym]).where('date <= ?', params[:endym]).destroy_all
            head :no_content
        else
            render json: { error: "Failed to destroy" }, status: 422
        end
    end

    def import
        errRows = Incomedata.import(params[:file])
        if errRows
            render json: errRows
        else
            render json: errRows.errors, status: 422
        end
    end

    private
    def incomedata_params
        params.require(:incomedata).permit(:date, :content, :amount, :litem, :mitem)
    end
end
