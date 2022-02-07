import React, { useState } from 'react';
import styled from 'styled-components';
import { RechartsBar } from './components/RechartsBar'
import { Controller, useForm } from 'react-hook-form';
import { DatePicker } from './components/DatePicker';
import { AxiosError, AxiosResponse } from 'axios';
import { IncomeData } from './Tyeps';


const Navbar = styled.nav`
  background: #ffffff;
  min-height: 10vh;
  display: flex;
  justify-content: space-around;
  align-items: center;
  margin-bottom: 15vh;
`

type targetYm = {
    beginym: string
    endym:string
}

const initialIncomeData: IncomeData[] = [
    { date: '2021/04/01', content: 'test', amount: -500, litem: '食費', mitem: '食料品'},
    { date: '2021/05/01', content: 'test', amount: -200, litem: '食費', mitem: '食料品'},
    { date: '2021/06/01', content: 'test', amount: -200, litem: '食費', mitem: '外食'},
    { date: '2021/07/01', content: 'test', amount: -300, litem: '食費', mitem: '食料品'},
    { date: '2021/08/01', content: 'test', amount: -400, litem: '食費', mitem: '外食'},
    { date: '2021/04/01', content: 'test', amount: -300, litem: '日用品費', mitem: '日用品'},
    { date: '2021/05/01', content: 'test', amount: -800, litem: '日用品費', mitem: '日用品'},
    { date: '2021/06/01', content: 'test', amount: -300, litem: '日用品費', mitem: '日用品'},
    { date: '2021/07/01', content: 'test', amount: -300, litem: '日用品費', mitem: '日用品'},
    { date: '2021/07/02', content: 'test2', amount: -400, litem: '日用品費', mitem: '日用品'},
    { date: '2021/08/01', content: 'test', amount: -300, litem: '日用品費', mitem: '日用品'},
    { date: '2021/07/01', content: 'test', amount: -200, litem: '交際費', mitem: '特別費'},
    { date: '2021/08/01', content: 'test', amount: -235, litem: '交際費', mitem: '特別費'},
    { date: '2021/04/01', content: 'test', amount: 1654, litem: '収入', mitem: '給与'},
    { date: '2021/05/01', content: 'test', amount: 1802, litem: '収入', mitem: '給与'},
    { date: '2021/06/01', content: 'test', amount: 1903, litem: '収入', mitem: '給与'},
    { date: '2021/07/01', content: 'test', amount: 1401, litem: '収入', mitem: '給与'},
    { date: '2021/08/01', content: 'test', amount: 2105, litem: '収入', mitem: '給与'}
]

type FormValues = {
    beginYm: Date;
    endYm: Date;
}

export const Main = () => {

    const [datas, setDatas] = useState<IncomeData[]>(initialIncomeData)

    const axiosBase = require('axios')
    const axios = axiosBase.create({
        baseURL: process.env.REACT_APP_DEV_API_URL,
        headers: {
            'Content-Type': 'application/json',
            'X-Requested-with': 'XMLHttpRequest'
        },
        ResponseType: 'json'
    })

    const { handleSubmit, control, formState: { errors }, getValues } = useForm<FormValues>(
        {defaultValues: {beginYm: new Date(), endYm: new Date(new Date().getFullYear(), new Date().getMonth() + 1, 1)}});

    const onSubmit = ((data: FormValues) => {
        console.log(`done:submit=${data.beginYm.toISOString().slice(0, 10)},${data.endYm.toISOString().slice(0, 10)}`)
        var targetPeriod: targetYm = {beginym: data.beginYm.toISOString().slice(0, 10), 
                                        endym: data.endYm.toISOString().slice(0, 10)}
        axios.get('/incomedatas', {params: targetPeriod})
        .then((resp: AxiosResponse) => {
            console.log(resp.data)
            setDatas(resp.data)
        })
        .catch((e: AxiosError) => {
            console.log(e)
        })
    })

    return (
        <div>
            <form onSubmit={handleSubmit(onSubmit)}>
                <Navbar>
                <DatePicker
                    label="開始年月"
                    name="beginYm"
                    control={control}
                    error={errors.beginYm?.message}
                    anotherdate={getValues("endYm")}
                />
                <DatePicker
                    label="終了年月"
                    name="endYm"
                    control={control}
                    error={errors.endYm?.message}
                    anotherdate={getValues("beginYm")}
                />
                <input type="submit"/>
                </Navbar>
            </form>
            <RechartsBar
                datas={datas}
            />
        </div>
    )
}

export default Main;