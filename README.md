# SFScrollLabel

[![CI Status](https://img.shields.io/travis/shefeng/SFScrollLabel.svg?style=flat)](https://travis-ci.org/shefeng/SFScrollLabel)
[![Version](https://img.shields.io/cocoapods/v/SFScrollLabel.svg?style=flat)](https://cocoapods.org/pods/SFScrollLabel)
[![License](https://img.shields.io/cocoapods/l/SFScrollLabel.svg?style=flat)](https://cocoapods.org/pods/SFScrollLabel)
[![Platform](https://img.shields.io/cocoapods/p/SFScrollLabel.svg?style=flat)](https://cocoapods.org/pods/SFScrollLabel)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SFScrollLabel is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SFScrollLabel'
```

##定义:
```
SFScrollLabel *scrollLabel = [[SFScrollLabel alloc] init];
scrollLabel.frame = CGRectMake(50, 300, 200, 20);
```

##配置:
```
[scrollLabel config:@"向左滚动向左滚动向左滚动向左滚动向左滚动向左滚动" textFont:[UIFont systemFontOfSize:16] textColor:[UIColor redColor] scrollDirection:SFScrollLabelDirectionLeft scrollSpeed:30];
```

##开始滚动:
```
[scrollLabel startScroll];
```

##停止滚动:
```
[scrollLabel stopScroll];
```

## Author

shefeng, shefeng@aliyun.com

## License

SFScrollLabel is available under the MIT license. See the LICENSE file for more info.
