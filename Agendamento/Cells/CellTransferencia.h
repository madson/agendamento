//
//  CellTransferencia.h
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Transferencia;

@interface CellTransferencia : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *origem;
@property (nonatomic, strong) IBOutlet UILabel *destino;
@property (nonatomic, strong) IBOutlet UILabel *valor;
@property (nonatomic, strong) IBOutlet UILabel *dataAgendada;

- (void)setTransferencia:(Transferencia *)transferencia;

@end
