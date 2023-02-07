/********************************************************************************************************************************************/



/********************************************************************************************************************************************/
/*
    sectional  :chang_Function.h file
		part       :three part
    Project    :Clock
*/
#include "Time_sub_Function.h"
/*  设置时间的所有函数
    部分函数与Time_sub_Function功能相同
*/
int *var_number_2();                    // 1-9数字代码函数
int value_2(int value);                 //赋值函数2
void shift();                           //切换函数，调用所有的子函数
void returnnumber_1(int value2);        //返回函数2
void date_struct_change_1();            //数值转换为每个位的函数2
void show(int i);                       //判断目前16进制中最后一位的点在1、4、7中的那一位，若在对应位上则将对应位的数字加1，同时当second=60时将second=0,minute+=1,同理minute与hour位运算与second保持一致
void show_1(int i);                     //判断目前16进制中最后一位的点在1、4、7中的那一位，若在对应位上则将对应位的数字减1，若second=-1则second=59,同理hour、minute与second一致

//date_struct_change_1-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void date_struct_change_1()							//个，十分离函数
{
    printf_value[0] = (date_change_1->hour) / 10;
    printf_value[1] = (date_change_1->hour) % 10;
    printf_value[3] = (date_change_1->minute) / 10;
    printf_value[4] = (date_change_1->minute) % 10;
    printf_value[6] = (date_change_1->second) / 10;
    printf_value[7] = (date_change_1->second) % 10;
}

// variable number array---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
int *var_number_2()
{
    code int array_1[10] = {~0x40,~0x79, ~0x24, ~0x30, ~0x19, ~0x12, ~0x02, ~0x78, ~0x00, ~0x10};
    int *q;
    q = array_1;
    return q;
}

//value_2-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
int value_2(int value)
{
    int sub_value = 0;
    sub_value     = *(var_number_2() + value);
    return sub_value;
}

//returnnumber_1-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void returnnumber_1(int value2)
{
    int i;
    for (i = 0; i < 8; ++i) {
        printf_value_1[i] = value(printf_value[i]);
        if (i == 2 || i == 5) {
            printf_value_1[i] = ~0xbf;
            continue;
        } else if (i == value2) {
            printf_value_1[i] = value_2(printf_value[i]);
        }
    }
}

//以上代码与Time_sub_Function相同
//show-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void show(int i)																	//执行每位加代码，根据秒、分、小时位加相应的数值
{
    if (i == 7) {
        date_change_1->second += 1;
        if (date_change_1->second == 60) {
            date_change_1->minute += 1;
            date_change_1->second = 0;
            if (date_change_1->minute == 60) {
                date_change_1->hour += 1;
                date_change_1->minute = 0;
                if (date_change_1->hour == 24) {
                    date_change_1->second = 0;
                    date_change_1->minute = 0;
                    date_change_1->hour   = 0;
                }
            }
        }
    } else if (i == 4) {
        date_change_1->minute += 1;
        if (date_change_1->minute == 60) {
            date_change_1->hour += 1;
            date_change_1->minute = 0;
            if (date_change_1->hour == 24) {
                date_change_1->second = 0;
                date_change_1->minute = 0;
                date_change_1->hour   = 0;
            }
        }
    } else if (i == 1) {
        date_change_1->hour += 1;
        if (date_change_1->hour == 24) {
            date_change_1->hour   = 0;
        }
    }
}

//show_1-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void show_1(int i)															//执行每位减代码，根据秒、分、小时位减相应的数值
{
    if (i == 7) {
        date_change_1->second -= 1;
        if (date_change_1->second == -1) {
            date_change_1->second = 59;
        }
    } else if (i == 4) {
        date_change_1->minute -= 1;
        if (date_change_1->minute == -1) {
            date_change_1->minute = 59;
        }
    } else if (i == 1) {
        date_change_1->hour -= 1;
        if (date_change_1->hour == -1) {
            date_change_1->hour = 23;
        }
    }
}

//switch To time change function-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void shift()																		//切换函数核心代码，在此文件中类似mian函数
{

    int i                 =                   7;
    date_change_1->hour   = date_change->hour  ;
    date_change_1->minute = date_change->minute;
    date_change_1->second = date_change->second;
    date_struct_change_1();
    returnnumber_1(i);
    for (address = 0; address < 8; address++) {
        display(address, address);
    }
    while (1) {
        if (end == 0) {
            delay(1);
            while(end == 1);
            delay(1);
            while(end == 1);
            break;
        } else {
            if (left == 0) {
                delay(1);
                while(left == 1);
                delay(1);
                while(left == 0);
                i = i - 3;
                if (i == -2) {
                    i = 7;
                }
            } else if (right == 0) {
                delay(1);
                while(right == 1);
                delay(1);
                while(right == 0);
                i = i + 3;
                if (i == 10) {
                    i = 1;
                }
            } else if (add == 0) {
                delay(1);
                while(add == 1);
                delay(1);
                while(add == 0);
                show(i);
            } else if (subtraction == 0) {
                delay(1);
                while(subtraction == 1);
                delay(1);
                while(subtraction == 0);
                show_1(i);
            }
        }

        for (address = 0; address < 8; address++) {			//送显
            date_struct_change_1();
            returnnumber_1(i);
            display(address, address);
        }

    }
}
