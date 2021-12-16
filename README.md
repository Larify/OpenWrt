# 构建OpenWrt固件

目录说明
```
.
├── .github
│   └── workflows                   # Actions存放目录
│       ├── OpenWrt-Lean.yml        # Lean的构建配置
│       ├── OpenWrt-Lienol.yml      # Lienol的构建配置
│       └── update-checker.yml
├── LICENSE
├── README.md
├── configs                         # 插件打包配置存放目录
│   ├── README.md
│   ├── index.js                    # 配置转换排序文件，使用 `node index.js` 执行即可
│   ├── Lean.feeds.conf             # Lean的构建配置
│   └── Lienol.feeds.conf           # Lienol的构建配置
├── feeds                           # feeds 配置存放目录
│   ├── feeds.conf.Lean             # 新增的Lean配置，内容会添加到源码的 feeds.conf.default 文件末尾
│   └── feeds.conf.Lienol           # 新增的Lienol配置，内容会添加到源码的 feeds.conf.default 文件末尾
└── scripts                         # 构建流程的执行脚本
.   ├── Lean
.   │   ├── packages.sh             # 用于添加一些插件
.   │   └── config.sh               # 用于配置插件
.   └── Lienol
.       ├── packages.sh             # 用于添加一些插件
.       └── config.sh               # 用于配置插件
.
.
.
└─ files                           # 初始化配置（软路由备份出来的配置，如有，解压备份文件到此处即可）
    └── etc
        ├── config                  # 一般只需要在这里放置备份出来的对应配置文件即可
        ├── dropbear                # SSH连接的公钥证书配置
        └── ...                     # 其他设置目录文件
```

<br><br><br>
---
<br>


**English** | [中文](https://p3terx.com/archives/build-openwrt-with-github-actions.html)

# Actions-OpenWrt

[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/P3TERX/Actions-OpenWrt/blob/master/LICENSE)
![GitHub Stars](https://img.shields.io/github/stars/P3TERX/Actions-OpenWrt.svg?style=flat-square&label=Stars&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/P3TERX/Actions-OpenWrt.svg?style=flat-square&label=Forks&logo=github)

A template for building OpenWrt with GitHub Actions

## Usage

- Click the [Use this template](https://github.com/P3TERX/Actions-OpenWrt/generate) button to create a new repository.
- Generate `.config` files using [Lean's OpenWrt](https://github.com/coolsnowwolf/lede) source code. ( You can change it through environment variables in the workflow file. )
- Push `.config` file to the GitHub repository.
- Select `Build OpenWrt` on the Actions page.
- Click the `Run workflow` button.
- When the build is complete, click the `Artifacts` button in the upper right corner of the Actions page to download the binaries.

## Tips

- It may take a long time to create a `.config` file and build the OpenWrt firmware. Thus, before create repository to build your own firmware, you may check out if others have already built it which meet your needs by simply [search `Actions-Openwrt` in GitHub](https://github.com/search?q=Actions-openwrt).
- Add some meta info of your built firmware (such as firmware architecture and installed packages) to your repository introduction, this will save others' time.

## Credits

- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub Actions](https://github.com/features/actions)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cowtransfer](https://cowtransfer.com)
- [WeTransfer](https://wetransfer.com/)
- [Mikubill/transfer](https://github.com/Mikubill/transfer)
- [softprops/action-gh-release](https://github.com/softprops/action-gh-release)
- [ActionsRML/delete-workflow-runs](https://github.com/ActionsRML/delete-workflow-runs)
- [dev-drprasad/delete-older-releases](https://github.com/dev-drprasad/delete-older-releases)
- [peter-evans/repository-dispatch](https://github.com/peter-evans/repository-dispatch)

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © [**P3TERX**](https://p3terx.com)
