
//
// Copyright 2011 Box, Inc.
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//

#import "BoxSelectToPrivShareViewController.h"
#import "BoxShareViewController.h"


@interface BoxSelectToPrivShareViewController ()

@end

@implementation BoxSelectToPrivShareViewController

#pragma mark - Table view delegate

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    BoxShareViewController * shareController = [[BoxShareViewController alloc] initWithNibName:@"BoxShareViewController" bundle:nil];
    shareController.isPublicShare = NO;
    shareController.boxObject = (BoxObject*)[self.rootFolder.objectsInFolder objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:shareController animated:YES];
    [shareController release];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
