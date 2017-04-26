//
//  SXBookShelfCellTableViewCell.h
//  BookShelf
//
//  Created by tangyuhua on 2017/4/25.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SXBookShelfCell : UITableViewCell
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel     *nameLabel;
@property (nonatomic, strong) UILabel     *authorLabel;
@property (nonatomic, strong) UILabel     *progressLabel;

@end
