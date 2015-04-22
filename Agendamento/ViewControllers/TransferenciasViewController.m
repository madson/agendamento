//
//  TransferenciasViewController.m
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import "TransferenciasViewController.h"
#import "GerenciadorTransferencias.h"
#import "Transferencia.h"
#import "CellTransferencia.h"
#import "DetalheViewController.h"

NSString * const IDSegueDetalhe = @"segueDetalhe";
NSString * const IDSegueAdicionar = @"segueAdicionar";

@implementation TransferenciasViewController

#pragma mark - View controller life cycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[GerenciadorTransferencias lista] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellTransferencia";
    
    CellTransferencia *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    
    cell.transferencia = [GerenciadorTransferencias transferenciaPorIndice:indexPath.row];;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:IDSegueDetalhe]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        DetalheViewController *destino = segue.destinationViewController;
        destino.transferencia = [GerenciadorTransferencias transferenciaPorIndice:indexPath.row];
    }
    else if ([segue.identifier isEqualToString:IDSegueAdicionar]) {
        DetalheViewController *destino = segue.destinationViewController;
        destino.adicionando = YES;
    }
}

@end
