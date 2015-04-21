//
//  DataHelpers.h
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHelpers : NSObject

+ (NSInteger)diferencaDiasEntre:(NSDate *)umaData eData:(NSDate *)outraData;

+ (NSDate *)adicionaDias:(NSInteger)dias naData:(NSDate *)data;

@end
