//
//  TaxaTipoB.m
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import "TaxaTipoB.h"
#import "Transferencia.h"
#import "DataHelpers.h"

@implementation TaxaTipoB

/**
 B: Operações do tipo B tem uma taxa de:
    $10 para pedidos com agendamento até 30 dias da data de cadastro
    $8 para os demais
 */

- (NSNumber *)taxaParaTransferencia:(Transferencia *)transferencia
{
    NSDate *dataCadastro = transferencia.dataCadastro;
    NSDate *dataAgendada = transferencia.dataAgendada;
    
    NSInteger dias = [DataHelpers diferencaDiasEntre:dataCadastro eData:dataAgendada];
    
    return (dias <= 30) ? @(10) : @(8);
}

@end
