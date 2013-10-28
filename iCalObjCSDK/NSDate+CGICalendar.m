//
//  NSDate+CGICalendar.m
//
//  Created by Satoshi Konno on 5/12/11.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "NSDate+CGICalendar.h"

#define CGNSDATE_ICALENDAR_DATEFORMAT @"yyyyMMdd"
#define CGNSDATE_ICALENDAR_DATETMEFORMAT @"yyyyMMdd'T'kkmmss'Z'"
#define CGNSDATE_ISO8601_DATETMEFORMAT @"yyyy-MM-dd kk:mm:ss"

@implementation NSDate(CGICalendar)

+ (id)dateWithICalendarString:(NSString *)aString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	
	if (aString.length > 8)
	{
		static NSDateFormatter* formatter = nil;
		if (nil == formatter)
		{
			formatter = [[NSDateFormatter alloc] init];
			NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
			[formatter setTimeZone:timeZone];
			[formatter setDateFormat:CGNSDATE_ICALENDAR_DATETMEFORMAT];
		}
		
		dateFormatter = formatter;
	}
	else
	{
		static NSDateFormatter* formatter = nil;
		if (nil == formatter)
		{
			formatter = [[NSDateFormatter alloc] init];
			[formatter setDateFormat:CGNSDATE_ICALENDAR_DATEFORMAT];
		}
		
		dateFormatter = formatter;
	}
	
    NSDate * result = [dateFormatter dateFromString:aString];
	
	return result;
}

+ (id)dateWithICalendarISO8601:(NSString *)aString
{
	static NSDateFormatter* dateFormatter = nil;
	
	if (nil == dateFormatter)
	{
		[dateFormatter setTimeStyle:NSDateFormatterFullStyle];
		[dateFormatter setDateFormat:CGNSDATE_ISO8601_DATETMEFORMAT];
	}
	
    return [dateFormatter dateFromString:aString];
}

- (NSString *)descriptionICalendar
{
	static NSDateFormatter* dateFormatter = nil;
	
	if (nil == dateFormatter)
	{
		NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
		[dateFormatter setTimeZone:timeZone];
		[dateFormatter setDateFormat:CGNSDATE_ICALENDAR_DATETMEFORMAT];
	}

	return [dateFormatter stringFromDate:self];
}

- (NSString *)descriptionISO8601
{
	static NSDateFormatter* dateFormatter = nil;
	
	if (nil == dateFormatter)
	{
		[dateFormatter setLocale:[NSLocale systemLocale]];
		[dateFormatter setDateFormat:CGNSDATE_ISO8601_DATETMEFORMAT];
	}
	
	return [dateFormatter stringFromDate:self];
}

@end 
