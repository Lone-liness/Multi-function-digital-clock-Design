/*
    sectional  :Time.c file
		part       :first part
    student ID :22B103090106 宋宇航
	  student ID :22B103090121 田全鑫
    date       :2022.12.1
    Project    :Clock
*/
/********************************************************************************************************************************************/
#include "chang_function_2.h"                                                       //include Time_sub_Function.c
int count=0;

void interrupt_time(void) interrupt 1 using 0 {		//中断程序
    TH0=(65536-50000)/256;		//TH0赋值
    TL0=(65536-50000)%256;		//TL0赋值
    TF0=0;										//TF0清零
    count++;									//计数按钮计数到20为一秒sum_time_1+1秒
    if(count==20) {						//计数满20则秒数加一
        sum_time_1++;
        count=0;							//count清零，执行
    }


}
//main------------------------------------------------------------------------------------------------------------------------------------------------
void main()
{
    int mark=0;								//上电蜂鸣器标志位
	  pm=0;
    kk=0;										  //矩阵键盘使得第一行四个键全部上电，只用第一行四个键
    TMOD=0X01;
    TH0=(65536-50000)/256;
    TL0=(65536-50000)%256;
    ET0=1;								  //开ET0中断
    EA=1;										//开EA总中断
    TR0=1;									//启动定时器T0
    init();                 //初始化函数
begin:
    TR0=1;
    function[0] = date_struct_change;                                               //给指针函数组赋值date_struct_change
    function[1] = returnnumber;                                                     //给指针函数组赋值returnnumber
//loop fuction-----------------------------------------------------------------------------------------------------------------------------------
    while (1) {
        if (subtraction == 0 || add == 0 || right == 0 || left == 0) {  						//如果按了加、减、左移、右移、end按键进入设置模式
            TR0=0;
            TH0=(65536-50000)/256;
            TL0=(65536-50000)%256;
            TF0=0;
            shift();                                                                //调用shift函数，进入设置模式
            P0=0X00,P2=0X00;
            date_change->second   = date_change_1->second;
            date_change->minute   = date_change_1->minute;
            date_change->hour     = date_change_1->hour;
            date_change_1->minute = date_change->minute;
            date_change_1->hour   = date_change->hour;                              //赋值秒
            date_change_1->second = date_change->second;
            sum_time_1=date_change_1->second;
            delay(200);
            mark=1;
            goto begin;																															//跳转到begin
        }
        else if(restart==0) {																												//暂停启动按键
            delay(1);
            while(restart==1);
            delay(1);
            while(restart==0);
            TR0=~TR0;
        }
        else {
            if (sum_time_1 == 60) {                                                 //时间算法，如果sum_time_1为60，则minute加1，对sum_time_1清零
                date_change->minute += 1;
                if ((date_change->minute) == 60) {                                  //如果date_change_1->minute为60则date_change_1->hour加1
                    date_change->hour += 1;
                    if ((date_change->hour) == 24) {                                 //如果date_change_1->hour为24则date_change_1->minute与hour清零
                        date_change->minute = 0;
                        date_change->hour   = 0;
                    }
                    date_change->minute = 0;
                }
                sum_time_1 = 0;                                                    //计数寄存器清零
            }
//每8位循环显示，使得8位数码管全里亮----------------------------------------------------------------------------------------------------------------
            for (address = 0; address < 8; address++) {                             //循环送显
                format(sum_time_1);                                                 //调用格式化函数
                function[0]();                                                      //调用date_struct_change
                function[1]();                                                      //调用returnnume
                display(address, address);                                          //送显函数
// time algorithm-----------------------------------------------------------------------------------------------------------------------------------------------
                if ((date_change->minute) == 0&&mark==1) {                          //整点报时功能
                    if((date_change->second)>=0&&(date_change->second)<=60) {
                        if((date_change->second)>=0&&(date_change->second)<=3) {		//响三秒
                            pm=1;
                        }

                    }
                }
                else {
                    if((date_change->second) == 4) {																//若未进入shift模式正常模式则，上电后不报时，超过3秒后便可以把标志位置为位为1，我选择4秒，也可5秒，或其他
                        mark=1;
                    }
                }
            }
        }
    }
}