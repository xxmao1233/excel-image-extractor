# Excel 图片提取工具 - 离线静态版

## 项目概述

从 Excel 表格（`.xlsx`）中提取图片，按指定列的命名自动重命名并打包为 ZIP 下载。

### 功能特性

- **文件上传**：支持点击上传和拖拽上传 `.xlsx` 文件
- **列设置**：自定义图片所在列和命名所在列（默认 A/B 列）
- **图片提取**：自动解析 xlsx 中的浮动图片和嵌入单元格图片
- **智能压缩**：图片 > 1MB 自动压缩（JPEG 质量不低于 60，必要时缩小尺寸）
- **重名处理**：同名图片自动添加序号（`图片_1.png`、`图片_2.png`）
- **网格预览**：以卡片网格展示所有图片，显示文件名和大小
- **打包下载**：一键打包为 ZIP 下载

## 文件目录结构

```
offline-export/
├── index.html                    # 入口页面（直接打开即可使用）
├── assets/
│   ├── index-BBMOGCqh.js         # 所有 JavaScript 逻辑（含 JSZip 等依赖）115KB
│   └── index-BTDVxxGt.css        # 样式文件（含 Tailwind CSS）12KB
└── README.md                     # 本说明文件
```

## 本地运行方式

### 方式一：直接打开（推荐）

1. 双击 `index.html` 在浏览器中打开
2. 上传 `.xlsx` 文件即可使用

> ⚠️ 注意：部分浏览器直接打开本地文件时，`file://` 协议可能限制 JavaScript 功能。如果遇到问题，请使用方式二或方式三。

### 方式二：Python 本地服务器

```bash
# 进入离线包目录
cd offline-export

# 启动 HTTP 服务器（Python 3）
python -m http.server 8080

# 或者（Python 2）
python -m SimpleHTTPServer 8080
```

然后在浏览器访问：`http://localhost:8080`

### 方式三：Node.js 本地服务器

```bash
# 安装 serve（全局）
npm install -g serve

# 进入离线包目录启动服务
cd offline-export
serve .

# 或者使用 npx 直接运行（无需安装）
npx serve offline-export
```

## 使用说明

1. 打开页面后，点击上传区域或拖拽 `.xlsx` 文件到虚线框内
2. 设置图片所在列（默认 A）和命名所在列（默认 B）
3. 点击"提取图片"按钮
4. 等待处理完成后，预览所有提取的图片
5. 点击"下载全部图片 (ZIP)"打包下载

## 技术栈

- 原生 HTML + CSS + JavaScript（TypeScript 编译产物）
- Tailwind CSS（编译为原生 CSS，无运行时依赖）
- JSZip（内置打包，无需外部 CDN）
- Canvas API（图片压缩）

## 离线运行说明

此版本为**完全离线可运行**的静态文件包：
- ✅ 所有依赖（JSZip 等）已打包进 JS 文件
- ✅ 无需网络连接
- ✅ 无需任何后端服务
- ✅ 无需安装 Node.js 或 Python（方式一直接打开）
- ✅ 不依赖任何云端平台