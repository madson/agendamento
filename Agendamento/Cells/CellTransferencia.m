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
    self.origem.text = t1.origem;
    self.destino.text = t1.destino;
    self.dataAgendada.text = [[FormatterHelper dateFormatter] stringFromDate:t1.dataAgendada];
    self.valor.text = t1.valor.description;
}

@end
