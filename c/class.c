#include <stdio.h>

typedef struct Date {
    int day;
    int month;
    int year;
} Date;

void print_date(Date* d);
void set_date(Date* d, int day, int month, int year);

int main(){
	Date date;

	set_date(&date, 5, 10, 2001);
	print_date(&date);

	return 0;
}

void set_date(Date* d, int day, int month, int year){
	if (day > 0 && day < 32)
		d->day = day;
	if (month > 0 && month < 13)
		d->month = month;
	if (year > 0)
		d->year = year;
}

void print_date(Date* d){
	printf("%d-%d-%d", d->day, d->month, d->year);
}