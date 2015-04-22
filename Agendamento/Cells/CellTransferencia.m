//
//  CellTransferencia.m
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import "CellTransferencia.h"
#import "Transferencia.h"
#import "FormatterHelper.h"

@implementation CellTransferencia

- (void)setTransferencia:(Transferencia *)t1
{
    _origem.text = t1.origem;
    _destino.text = t1.destino;
    _dataAgendada.text = [[FormatterHelper dateFormatter] stringFromDate:t1.dataAgendada];
    _valor.text = [[FormatterHelper currencyFormatter] stringFromNumber:t1.valor];
}

@end
