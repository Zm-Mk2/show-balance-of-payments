class Incomedata < ApplicationRecord
    def self.import(file)
        errRows = []
        nowRow = 0
        CSV.foreach(file.path, headers: false).each_slice(100) do |rows|
            incomedatas = []
            rows.each do |row|
                isNormalRow = true
                nowRow += 1

                # 日付チェック
                if date_valid?(row[0])
                    # 正常データ
                else
                    isNormalRow = false
                end

                # 金額チェック
                if /^[+-]?[0-9]+$/ =~ row[2].to_s
                    #正常データ
                else
                    isNormalRow = false
                end

                # 大項目チェック
                if row[3].blank?
                    isNormalRow = false
                end

                if isNormalRow
                    incomedatas <<
                    {
                        #id: nil,
                        date: row[0],
                        content: row[1],
                        amount: row[2],
                        litem: row[3],
                        mitem: row[4],
                        created_at: Time.current,
                        updated_at: Time.current
                    }
                else
                    errRows.push(nowRow)
                end

            end
            if incomedatas.length > 0
                Incomedata.insert_all!(incomedatas)
            end
        end
        return errRows
    end
end

private

def date_valid?(str)
    !! Date.parse(str) rescue false
end