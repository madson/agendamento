//
//  Transferencia.m
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import "Transferencia.h"
#import "Calculadora.h"
#import "DataHelpers.h"

@implementation Transferencia

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _dataCadastro = [NSDate date];
    }
    
    return self;
}

- (void)agendarPara:(NSInteger)dias
{
    self.dataAgendada = [DataHelpers adicionaDias:dias naData:NSDate.date];
}

/**
 Getter da taxa
 */
- (NSNumber *)taxa
{
    return [Calculadora taxaParaTransferencia:self];
}

@end
