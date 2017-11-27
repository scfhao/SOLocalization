# SOLocalization

Configure multi-language environment in iOS application.

在 iOS 应用中切换使用的语言。

## Usage

### Export SOLocalization

Copy SOLocalization.{h, m} and UIKit Folder to your project.

把 SOLocalization 类文件及 UIKit 文件夹中的文件复制到你的项目中。

### Create strings file

Create Strings file for your project, The default strings file is named infoPlist.strings.

创建本地化字符串文件，默认为 infoPlist.strings，设置好需要本地化的内容。

### Set Localized String

Set property for supported UIKit element

为 UIKit 元素设置需要的属性，像下面这样简单：

```
UIBarButtonItem *change = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(changeLanguage:)];
change.sol_title = @"Setting";
self.navigationItem.rightBarButtonItem = change;

self.label.sol_text = @"label";
[self.button sol_setTitle:@"button" forState:UIControlStateNormal];

self.textField.sol_placeholder = @"textField placeholder";

self.navigationItem.sol_title = @"title";
```

or, direct use `SOLocalizedStringFromTable` get localized string

对于不支持的 UIKit 元素，也可以像下面的代码这样获取本地化字符：

```
self.title = SOLocalizedStringFromTable(@"title", @"infoPlist");
```

### Setting application Language

切换应用中的语言

```
// to use English
[SOLocalization sharedLocalization].region = SOLocalizationEnglish;

// to use 简体中文
[SOLocalization sharedLocalization].region = SOLocalizationSimplifiedChinese;
```

## License

SOLocalization is available under the MIT license. See the LICENSE file for more info.
