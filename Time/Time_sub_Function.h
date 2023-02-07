/********************************************************************************************************************************************/



/********************************************************************************************************************************************/
/*
    sectional  :Time_sub_Function.h file
		part       :second part
    Project    :Clock
*/

// head file
#include <intrins.h>                                                     //包含精确时钟函数
#include <reg52.h>                                                       // 包含C52库
#include <math.h>                                                        // 包含数学计算函数原型
//define I/O---------------------------------------------------------------------------------------------------------
sbit left        = P3 ^ 1;                                               //定义左移按键
sbit right       = P3 ^ 0;                                               //定义右移按键
sbit add         = P3 ^ 2;                                               //定义加按键
sbit subtraction = P3 ^ 3;                                               //定义减按键
sbit pm          = P2 ^ 5;                                               //定义蜂鸣器引脚
sbit restart     = P1 ^ 2;                                               //定义启动暂停按键
sbit kk          = P1 ^ 7;                                               //定义横向扫描端口
sbit end         = P1 ^ 3;                                               //定义结束按键
//定义整数---------------------------------------------------------------------------------------------------------
int sum_time_1 = 0;                                                      //定义总时间
int address    = 0;
//-------------------------------------------------------------------------------------------------
int printf_value[8], printf_value_1[8];                                  //定义输出值1，2
int address_array[8] = {0x1c,0x18,0x14,0x10,0x0c,0x08,0x04,0x00};        //定义扫描引脚，从左向右扫描
int value();                                                             //赋值函数
// struct-----------------------------------------------------------------------------------------
struct date_struct {                                                    //定义时间结构体
    int hour;
    int minute;
    int second;
};
struct date_struct set_date, date, *date_change = &date, *date_change_1 = &set_date; //定义结构体，与结构体指针
// all sub_Function--------------------------------------------------------------------------------
void display(int location, int number);                                             //在相应位置显示对应的数字
void date_struct_change();                                                          //将两位数字分解函数
void format(int sumTime);                                                           //格式化函数
void (*function[2])();                                                              //定义指针函数
void returnnumber();                                                                //对对应位置进行数字的16进制赋值
int *var_number();                                                                  // 1-9数字代码函数
void delay_1();                                                                     //延时函数
void init();                                                                        //初始化程序
void delay(unsigned int ms);                                                        //延时函数2
// delay function--------------------------------------------------------------------------------
void delay_1()                                                                      //@12.000MHz
{
    _nop_();
}
void delay(unsigned int ms)
{
    unsigned char tt;
    while (ms--) {                                                                  // 外循环
        for (tt = 0; tt < 246; tt++) {}                                             // 内循环,形成ms信号
    }
}

// variable number array--------------------------------------------------------------------------------
int *var_number()
{
    int array[10] = {~0xc0, ~0xf9, ~0xa4, ~0xb0, ~0x99, ~0x92, ~0x82, ~0xf8, ~0x80, ~0x90};
    int *p;
    p = array;
    return p;
}
// format sumTime value--------------------------------------------------------------------------
void format(int sumTime)
{
    date_change->second = sumTime; //给秒赋值
}
// date_struct_change--------------------------------------------------------------------------------
void date_struct_change()																								//个、十位分离代码
{
    printf_value[0] = (date_change->hour) / 10;
    printf_value[1] = (date_change->hour) % 10;
    printf_value[3] = (date_change->minute) / 10;
    printf_value[4] = (date_change->minute) % 10;
    printf_value[6] = (date_change->second) / 10;
    printf_value[7] = (date_change->second) % 10;
}
// value------------------------------------------------------------------------------------------------
int value(int value)																									 //根据value值返回每个位的数
{
    int sub_value = 0;
    sub_value     = *(var_number() + value);
    return sub_value;
}
// returnnumber----------------------------------------------------------------------------------------------
void returnnumber()																										  //显示的数组赋值
{
    int i;
    for (i = 0; i < 8; ++i) {
        printf_value_1[i] = value(printf_value[i]);
        if (i == 2 || i == 5) {
            printf_value_1[i] = ~0xbf;
            continue;
        }
    }
}
// display------------------------------------------------------------------------------------------------
void display(int location, int number)															  	//显示函数
{
//    P0 = 0xff;
   
        P2 = address_array[location], P0 = printf_value_1[number];
   
    delay_1();
}
// init------------------------------------------------------------------------------------------------
void init()																													//初始化函数
{
    date.second = 0;
    date.minute = 0;
    date.hour   = 0;
    date_change->second = 0;
    date_change->minute = 0;
    date_change->hour   = 0;
    date_change_1->second = 0;
    date_change_1->minute = 0;
    date_change_1->hour   = 0;
}