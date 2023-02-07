
#line 1 "Time.c" /0







 
 
  
#line 1 "chang_function_2.h" /0
 
 
 
 
 




 
  
#line 1 "Time_sub_Function.h" /0
 
 
 
 
 




 
 
 
  
#line 1 "D:\Keil\keil_main_file\C51\Inc\intrins.h" /0






 
 
 
 
 
 #pragma SAVE
 
 
#line 15 "D:\Keil\keil_main_file\C51\Inc\intrins.h" /1
 
 
 
#line 18 "D:\Keil\keil_main_file\C51\Inc\intrins.h" /0
 
 extern void          _nop_     (void);
 extern bit           _testbit_ (bit);
 extern unsigned char _cror_    (unsigned char, unsigned char);
 extern unsigned int  _iror_    (unsigned int,  unsigned char);
 extern unsigned long _lror_    (unsigned long, unsigned char);
 extern unsigned char _crol_    (unsigned char, unsigned char);
 extern unsigned int  _irol_    (unsigned int,  unsigned char);
 extern unsigned long _lrol_    (unsigned long, unsigned char);
 extern unsigned char _chkfloat_(float);
 
#line 29 "D:\Keil\keil_main_file\C51\Inc\intrins.h" /1
 
 
 
#line 32 "D:\Keil\keil_main_file\C51\Inc\intrins.h" /0
 
 extern void          _push_    (unsigned char _sfr);
 extern void          _pop_     (unsigned char _sfr);
 
 
 #pragma RESTORE
 
 
 
#line 13 "Time_sub_Function.h" /0
 
  
#line 1 "D:\Keil\keil_main_file\C51\Inc\reg52.h" /0






 
 
 
 
 
 
 sfr P0    = 0x80;
 sfr P1    = 0x90;
 sfr P2    = 0xA0;
 sfr P3    = 0xB0;
 sfr PSW   = 0xD0;
 sfr ACC   = 0xE0;
 sfr B     = 0xF0;
 sfr SP    = 0x81;
 sfr DPL   = 0x82;
 sfr DPH   = 0x83;
 sfr PCON  = 0x87;
 sfr TCON  = 0x88;
 sfr TMOD  = 0x89;
 sfr TL0   = 0x8A;
 sfr TL1   = 0x8B;
 sfr TH0   = 0x8C;
 sfr TH1   = 0x8D;
 sfr IE    = 0xA8;
 sfr IP    = 0xB8;
 sfr SCON  = 0x98;
 sfr SBUF  = 0x99;
 
 
 sfr T2CON  = 0xC8;
 sfr RCAP2L = 0xCA;
 sfr RCAP2H = 0xCB;
 sfr TL2    = 0xCC;
 sfr TH2    = 0xCD;
 
 
 
 
 sbit CY    = PSW^7;
 sbit AC    = PSW^6;
 sbit F0    = PSW^5;
 sbit RS1   = PSW^4;
 sbit RS0   = PSW^3;
 sbit OV    = PSW^2;
 sbit P     = PSW^0;  
 
 
 sbit TF1   = TCON^7;
 sbit TR1   = TCON^6;
 sbit TF0   = TCON^5;
 sbit TR0   = TCON^4;
 sbit IE1   = TCON^3;
 sbit IT1   = TCON^2;
 sbit IE0   = TCON^1;
 sbit IT0   = TCON^0;
 
 
 sbit EA    = IE^7;
 sbit ET2   = IE^5;  
 sbit ES    = IE^4;
 sbit ET1   = IE^3;
 sbit EX1   = IE^2;
 sbit ET0   = IE^1;
 sbit EX0   = IE^0;
 
 
 sbit PT2   = IP^5;
 sbit PS    = IP^4;
 sbit PT1   = IP^3;
 sbit PX1   = IP^2;
 sbit PT0   = IP^1;
 sbit PX0   = IP^0;
 
 
 sbit RD    = P3^7;
 sbit WR    = P3^6;
 sbit T1    = P3^5;
 sbit T0    = P3^4;
 sbit INT1  = P3^3;
 sbit INT0  = P3^2;
 sbit TXD   = P3^1;
 sbit RXD   = P3^0;
 
 
 sbit SM0   = SCON^7;
 sbit SM1   = SCON^6;
 sbit SM2   = SCON^5;
 sbit REN   = SCON^4;
 sbit TB8   = SCON^3;
 sbit RB8   = SCON^2;
 sbit TI    = SCON^1;
 sbit RI    = SCON^0;
 
 
 sbit T2EX  = P1^1;  
 sbit T2    = P1^0;  
 
 
 sbit TF2    = T2CON^7;
 sbit EXF2   = T2CON^6;
 sbit RCLK   = T2CON^5;
 sbit TCLK   = T2CON^4;
 sbit EXEN2  = T2CON^3;
 sbit TR2    = T2CON^2;
 sbit C_T2   = T2CON^1;
 sbit CP_RL2 = T2CON^0;
 
 
#line 14 "Time_sub_Function.h" /0
 
  
#line 1 "D:\Keil\keil_main_file\C51\Inc\math.h" /0







 
 
 
 
 
 
#line 14 "D:\Keil\keil_main_file\C51\Inc\math.h" /1
 
  
 
 
 
  
 
 
 
 
 
 
 
 
#line 28 "D:\Keil\keil_main_file\C51\Inc\math.h" /0
 
 #pragma SAVE
 #pragma REGPARMS
 
 extern char  cabs  (char  val);
 extern int    abs  (int   val);
 extern long  labs  (long  val);
 
 
 extern float fabs  (float val);
 extern float sqrt  (float val);
 extern float exp   (float val);
 extern float log   (float val);
 extern float log10 (float val);
 extern float sin   (float val);
 extern float cos   (float val);
 extern float tan   (float val);
 extern float asin  (float val);
 extern float acos  (float val);
 extern float atan  (float val);
 extern float sinh  (float val);
 extern float cosh  (float val);
 extern float tanh  (float val);
 extern float atan2 (float y, float x);
 
 extern float ceil  (float val);
 extern float floor (float val);
 extern float modf  (float val, float *n);
 extern float fmod  (float x, float y);
 extern float pow   (float x, float y);
 
 
#line 60 "D:\Keil\keil_main_file\C51\Inc\math.h" /1
 
 
 
#line 63 "D:\Keil\keil_main_file\C51\Inc\math.h" /0
 
 #pragma RESTORE
 
 
#line 15 "Time_sub_Function.h" /0
 
 
 sbit left        = P3 ^ 1;                                                
 sbit right       = P3 ^ 0;                                                
 sbit add         = P3 ^ 2;                                                
 sbit subtraction = P3 ^ 3;                                                
 sbit pm          = P2 ^ 5;                                                
 sbit restart     = P1 ^ 2;                                                
 sbit kk          = P1 ^ 7;                                                
 sbit end         = P1 ^ 3;                                                
 
 int sum_time_1 = 0;                                                       
 int address    = 0;
 
 int printf_value[8], printf_value_1[8];                                   
 int address_array[8] = {0x1c,0x18,0x14,0x10,0x0c,0x08,0x04,0x00};         
 int value();                                                              
 
 struct date_struct {                                                     
 int hour;
 int minute;
 int second;
 };
 struct date_struct set_date, date, *date_change = &date, *date_change_1 = &set_date;  
 
 void display(int location, int number);                                              
 void date_struct_change();                                                           
 void format(int sumTime);                                                            
 void (*function[2])();                                                               
 void returnnumber();                                                                 
 int *var_number();                                                                   
 void delay_1();                                                                      
 void init();                                                                         
 void delay(unsigned int ms);                                                         
 
 void delay_1()                                                                       
 {
 _nop_();
 }
 void delay(unsigned int ms)
 {
 unsigned char tt;
 while (ms--) {                                                                   
 for (tt = 0; tt < 246; tt++) {}                                              
 }
 }
 
 
 int *var_number()
 {
 int array[10] = {~0xc0, ~0xf9, ~0xa4, ~0xb0, ~0x99, ~0x92, ~0x82, ~0xf8, ~0x80, ~0x90};
 int *p;
 p = array;
 return p;
 }
 
 void format(int sumTime)
 {
 date_change->second = sumTime;  
 }
 
 void date_struct_change()																								 
 {
 printf_value[0] = (date_change->hour) / 10;
 printf_value[1] = (date_change->hour) % 10;
 printf_value[3] = (date_change->minute) / 10;
 printf_value[4] = (date_change->minute) % 10;
 printf_value[6] = (date_change->second) / 10;
 printf_value[7] = (date_change->second) % 10;
 }
 
 int value(int value)																									  
 {
 int sub_value = 0;
 sub_value     = *(var_number() + value);
 return sub_value;
 }
 
 void returnnumber()																										   
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
 
 void display(int location, int number)															  	 
 {
 
 
 P2 = address_array[location], P0 = printf_value_1[number];
 
 delay_1();
 }
 
 void init()																													 
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
#line 11 "chang_function_2.h" /0
 


 
 int *var_number_2();                     
 int value_2(int value);                  
 void shift();                            
 void returnnumber_1(int value2);         
 void date_struct_change_1();             
 void show(int i);                        
 void show_1(int i);                      
 
 
 void date_struct_change_1()							 
 {
 printf_value[0] = (date_change_1->hour) / 10;
 printf_value[1] = (date_change_1->hour) % 10;
 printf_value[3] = (date_change_1->minute) / 10;
 printf_value[4] = (date_change_1->minute) % 10;
 printf_value[6] = (date_change_1->second) / 10;
 printf_value[7] = (date_change_1->second) % 10;
 }
 
 
 int *var_number_2()
 {
 code int array_1[10] = {~0x40,~0x79, ~0x24, ~0x30, ~0x19, ~0x12, ~0x02, ~0x78, ~0x00, ~0x10};
 int *q;
 q = array_1;
 return q;
 }
 
 
 int value_2(int value)
 {
 int sub_value = 0;
 sub_value     = *(var_number_2() + value);
 return sub_value;
 }
 
 
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
 
 
 
 void show(int i)																	 
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
 
 
 void show_1(int i)															 
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
 
 
 void shift()																		 
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
 
 for (address = 0; address < 8; address++) {			 
 date_struct_change_1();
 returnnumber_1(i);
 display(address, address);
 }
 
 }
 }
#line 10 "Time.c" /0
 
 int count=0;
 
 void interrupt_time(void) interrupt 1 using 0 {		 
 TH0=(65536-50000)/256;		 
 TL0=(65536-50000)%256;		 
 TF0=0;										 
 count++;									 
 if(count==20) {						 
 sum_time_1++;
 count=0;							 
 }
 
 
 }
 
 void main()
 {
 int mark=0;								 
 pm=0;
 kk=0;										   
 TMOD=0X01;
 TH0=(65536-50000)/256;
 TL0=(65536-50000)%256;
 ET0=1;								   
 EA=1;										 
 TR0=1;									 
 init();                  
 begin:
 TR0=1;
 function[0] = date_struct_change;                                                
 function[1] = returnnumber;                                                      
 
 while (1) {
 if (subtraction == 0 || add == 0 || right == 0 || left == 0) {  						 
 TR0=0;
 TH0=(65536-50000)/256;
 TL0=(65536-50000)%256;
 TF0=0;
 shift();                                                                 
 P0=0X00,P2=0X00;
 date_change->second   = date_change_1->second;
 date_change->minute   = date_change_1->minute;
 date_change->hour     = date_change_1->hour;
 date_change_1->minute = date_change->minute;
 date_change_1->hour   = date_change->hour;                               
 date_change_1->second = date_change->second;
 sum_time_1=date_change_1->second;
 delay(200);
 mark=1;
 goto begin;																															 
 }
 else if(restart==0) {																												 
 delay(1);
 while(restart==1);
 delay(1);
 while(restart==0);
 TR0=~TR0;
 }
 else {
 if (sum_time_1 == 60) {                                                  
 date_change->minute += 1;
 if ((date_change->minute) == 60) {                                   
 date_change->hour += 1;
 if ((date_change->hour) == 24) {                                  
 date_change->minute = 0;
 date_change->hour   = 0;
 }
 date_change->minute = 0;
 }
 sum_time_1 = 0;                                                     
 }
 
 for (address = 0; address < 8; address++) {                              
 format(sum_time_1);                                                  
 function[0]();                                                       
 function[1]();                                                       
 display(address, address);                                           
 
 if ((date_change->minute) == 0&&mark==1) {                           
 if((date_change->second)>=0&&(date_change->second)<=60) {
 if((date_change->second)>=0&&(date_change->second)<=3) {		 
 pm=1;
 }
 
 }
 }
 else {
 if((date_change->second) == 4) {																 
 mark=1;
 }
 }
 }
 }
 }
 }
