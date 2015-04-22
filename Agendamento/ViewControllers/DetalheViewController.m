//
//  DetalheViewController.m
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import "DetalheViewController.h"
#import "FormatterHelper.h"
#import "Transferencia.h"
#import "GerenciadorTransferencias.h"
#import "DataHelpers.h"

@interface DetalheViewController ()

@property (nonatomic, strong) NSArray *tipos;

@end

@implementation DetalheViewController

#pragma mark - View controller life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // assina notificação de alteração em textfields
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(mudouTexto)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:nil];
    
    if (_adicionando) {
        self.title = @"Novo agendamento";
        self.transferencia = Transferencia.new;
    }
    else {
        self.title = @"Editando";
        self.navigationItem.rightBarButtonItem = nil;
    }

    [self configuraComponentes];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self atribuiValoresDoObjeto];
}

#pragma mark - Helpers

- (void)configuraComponentes
{
    // tipos
    self.tipos = @[@"Tipo A", @"Tipo B", @"Tipo C", @"Tipo D"];
    _tipo.inputView = _pickerTipo;
    
    // data
    _pickerData.minimumDate = NSDate.date;
    _dataAgendada.inputView = _pickerData;
}

- (void)atribuiValoresDoObjeto
{
    _origem.text = _transferencia.origem;
    _destino.text = _transferencia.destino;
    _valor.text = _transferencia.valor.description;
    _tipo.text = [_tipos objectAtIndex:_transferencia.tipo];
    _taxa.text = [[FormatterHelper currencyFormatter] stringFromNumber:_transferencia.taxa];
    _dataAgendada.text = [[FormatterHelper dateFormatter] stringFromDate:_transferencia.dataAgendada];

    _pickerData.date = _transferencia.dataAgendada;
    [_pickerTipo selectRow:_transferencia.tipo inComponent:0 animated:NO];
}

- (void)atribuiValoresDaTela
{
    _transferencia.origem = _origem.text;
    _transferencia.destino = _destino.text;
    _transferencia.dataAgendada = _pickerData.date;
    _transferencia.valor = @([_valor.text doubleValue]);
    
    [self atribuiValoresDoObjeto];
}

#pragma mark - Actions

- (IBAction)salvar:(id)sender
{
    if (_adicionando) {
        [GerenciadorTransferencias adicionaTransferencia:_transferencia];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)mudouData:(UIDatePicker *)sender
{
    [self atribuiValoresDaTela];
}

#pragma mark - Textfield changes

- (void)mudouTexto
{
    [self atribuiValoresDaTela];
}

#pragma mark - Picker view delegates

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 4;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [_tipos objectAtIndex:row];;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    _transferencia.tipo = row;
    
    [self atribuiValoresDaTela];
}

@end
