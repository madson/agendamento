//
//  DataHelpers.m
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import "DataHelpers.h"

@implementation DataHelpers

#pragma mark - Helpers

+ (NSInteger)diferencaDiasEntre:(NSDate *)umaData eData:(NSDate *)outraData
{
    NSCalendar *calendario = [NSCalendar currentCalendar];
    NSDateComponents *componentes = [calendario components:NSCalendarUnitDay
                                                  fromDate:[calendario startOfDayForDate:umaData]
                                                    toDate:[calendario startOfDayForDate:outraData]
                                                   options:0];

    return componentes.day;
}

+ (NSDate *)adicionaDias:(NSInteger)dias naData:(NSDate *)data
{
    NSDateComponents *componentes = [NSDateComponents new];
    componentes.day = dias;
    
    NSCalendar *calendario = [NSCalendar currentCalendar];
    NSDate *nova = [calendario dateByAddingComponents:componentes
                                               toDate:[calendario startOfDayForDate:data]
                                              options:0];
    return nova;
}

@end
