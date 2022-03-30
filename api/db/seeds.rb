# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SAMPLE_INCOMEDATAS = [
    { date: '2022/04/01', content: 'test', amount: -1500, litem: '食費', mitem: '食料品'},
    { date: '2022/05/01', content: 'test', amount: -1200, litem: '食費', mitem: '食料品'},
    { date: '2022/06/01', content: 'test', amount: -3000, litem: '食費', mitem: '外食'},
    { date: '2022/07/01', content: 'test', amount: -3000, litem: '食費', mitem: '食料品'},
    { date: '2022/08/01', content: 'test', amount: -5000, litem: '食費', mitem: '外食'},
    { date: '2022/04/01', content: 'test', amount: -2300, litem: '日用品費', mitem: '日用品'},
    { date: '2022/05/01', content: 'test', amount: -2800, litem: '日用品費', mitem: '日用品'},
    { date: '2022/06/01', content: 'test', amount: -2300, litem: '日用品費', mitem: '日用品'},
    { date: '2022/07/01', content: 'test', amount: -4300, litem: '日用品費', mitem: '日用品'},
    { date: '2022/07/02', content: 'test2', amount: -1234, litem: '日用品費', mitem: '日用品'},
    { date: '2022/08/01', content: 'test', amount: -3300, litem: '日用品費', mitem: '日用品'},
    { date: '2022/07/01', content: 'test', amount: -2200, litem: '交際費', mitem: '特別費'},
    { date: '2022/08/01', content: 'test', amount: -1234, litem: '交際費', mitem: '特別費'},
    { date: '2022/04/01', content: 'test', amount: 6300, litem: '収入', mitem: '給与'},
    { date: '2022/05/01', content: 'test', amount: 5800, litem: '収入', mitem: '給与'},
    { date: '2022/06/01', content: 'test', amount: 7300, litem: '収入', mitem: '給与'},
    { date: '2022/07/01', content: 'test', amount: 8300, litem: '収入', mitem: '交通費'}
]

SAMPLE_INCOMEDATAS.each do |incomedata|
    Incomedata.create(incomedata)
end