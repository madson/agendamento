//
//  TaxaTipoA.m
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import "TaxaTipoA.h"
#import "Transferencia.h"

const int valorFixo = 2;
const double porcentagem = 0.03;

@implementation TaxaTipoA

/**
 A: Operações do tipo A tem uma taxa de $2 mais 3% do valor da transferência
*/

- (NSNumber *)taxaParaTransferencia:(Transferencia *)transferencia
{
    double valor = transferencia.valor.doubleValue;
    
    NSNumber *taxa = @(valor * porcentagem + valorFixo); // + 3% do valor da transferência + $2
    
    return taxa;
}

@end
