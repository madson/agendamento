//
//  DetalheViewController.h
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Transferencia;

@interface DetalheViewController : UITableViewController
                                    <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (nonatomic, assign) BOOL adicionando;
@property (nonatomic, strong) Transferencia* transferencia;

@property (nonatomic, weak) IBOutlet UITextField* origem;
@property (nonatomic, weak) IBOutlet UITextField* destino;
@property (nonatomic, weak) IBOutlet UITextField* dataAgendada;
@property (nonatomic, weak) IBOutlet UITextField* valor;
@property (nonatomic, weak) IBOutlet UITextField* tipo;
@property (nonatomic, weak) IBOutlet UITextField* taxa;
@property (nonatomic, weak) IBOutlet UIDatePicker* pickerData;
@property (nonatomic, weak) IBOutlet UIPickerView* pickerTipo;

- (IBAction)salvar:(id)sender;
- (IBAction)mudouData:(UIDatePicker *)sender;

@end
