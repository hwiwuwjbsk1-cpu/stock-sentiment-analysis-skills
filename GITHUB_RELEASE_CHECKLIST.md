# 📦 股票情绪分析 Skills - GitHub 发布包

## ✅ 完成清单

本 Skills 已整理完成，包含以下文件：

```
stock-sentiment-analysis/
├── .github/
│   └── workflows/
│       └── package-skills.yml      # GitHub Actions 自动打包工作流
├── skills/
│   ├── SKILL.md                    # Skill 主文件（含完整提示词）
│   ├── scripts/
│   │   └── call_api.py             # API 调用脚本
│   └── references/                 # 接口文档目录（可选，按需添加）
├── .env.example                    # 环境变量示例
├── .gitignore                      # Git 忽略配置
├── .clawhub                        # ClawHub 锁文件
├── _meta.json                      # 元数据信息
├── CONTRIBUTING.md                 # 贡献指南
├── LICENSE                         # MIT 许可证
├── README.md                       # 项目说明文档
├── RELEASE.md                      # 发布指南
└── requirements.txt                # Python 依赖
```

## 📋 发布步骤

### 1. 创建 GitHub 仓库

访问 https://github.com/new 创建新仓库：

- **仓库名称**：`stock-sentiment-analysis-skills`
- **描述**：股票情绪分析 Agent Skills - 基于六层数据的情绪分析报告
- **可见性**：Public（公开）
- **不要**勾选"Add a README file"

### 2. 推送代码到 GitHub

在本地执行以下命令：

```bash
# 进入 Skills 目录
cd C:\Users\guo\.openclaw\workspace\skills\stock-sentiment-analysis

# 初始化 Git（如果尚未初始化）
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Stock Sentiment Analysis Skills v1.0.0"

# 设置主分支
git branch -M main

# 添加远程仓库（替换 YOUR_USERNAME 为您的 GitHub 用户名）
git remote add origin https://github.com/YOUR_USERNAME/stock-sentiment-analysis-skills.git

# 推送到 GitHub
git push -u origin main
```

### 3. 创建第一个 Release（可选）

```bash
# 打标签
git tag -a v1.0.0 -m "Release version 1.0.0 - Initial release"

# 推送标签
git push origin --tags
```

GitHub Actions 会自动打包 Skills 并上传到 Release。

### 4. 配置 ClawHub 发布（可选）

如需同步发布到 ClawHub：

1. 在 GitHub 仓库 Settings → Secrets and variables → Actions
2. 添加 Secret：`CLAWHUB_TOKEN`（您的 ClawHub API Token）
3. 创建工作流文件 `.github/workflows/publish-to-clawhub.yml`

## 🔧 用户安装方式

### 方式一：手动安装（推荐）

```bash
# 1. 克隆仓库
git clone https://github.com/YOUR_USERNAME/stock-sentiment-analysis-skills.git
cd stock-sentiment-analysis-skills

# 2. 安装依赖
pip install -r requirements.txt

# 3. 配置 API Key
cp .env.example .env
# 编辑 .env 填入：INVESTODAY_API_KEY=your_key_here

# 4. 复制到 Skills 目录
# Cursor（个人级）
cp -r skills/ ~/.cursor/skills/stock-sentiment-analysis/

# Cursor（项目级）
cp -r skills/ .cursor/skills/stock-sentiment-analysis/

# Claude Code
cp -r skills/ ~/.claude/skills/stock-sentiment-analysis/

# OpenClaw
cp -r skills/ ~/.openclaw/workspace/skills/stock-sentiment-analysis/
```

### 方式二：下载 ZIP

1. 访问 GitHub 仓库
2. 点击 "Code" → "Download ZIP"
3. 解压后按上述步骤安装

### 方式三：通过 ClawHub（发布后）

```bash
clawhub install stock-sentiment-analysis
```

## 📝 核心功能

### 六层情绪分析

| 层次 | 数据窗口 | 核心指标 |
|------|----------|----------|
| 专业资金态度 | 近 8 季度 | 机构持股占比、基金持股变化 |
| 杠杆资金博弈 | 近 20 交易日 | 融资净买入、融券余量 |
| 主力资金流向 | 近 15 交易日 | 主力净流入、超大单方向 |
| 舆论情绪验证 | 近 30-90 天 | 新闻、研报观点 |
| 市场即时反馈 | 实时 | 涨跌幅、板块联动 |

### 输出报告结构

1. 🧭 一句话结论
2. 🪪 情绪画像总览（表格）
3. ✅ 当前亮点
4. ⚠️ 当前风险
5. 🔍 详细情绪分析
6. 👀 下一期重点观察
7. 🛡️ 风险提示

## 🔐 安全注意事项

1. **API Key 安全**
   - 切勿将 `.env` 文件提交到 Git
   - 切勿在代码中硬编码 API Key
   - 定期更换 API Key

2. **合规使用**
   - 数据仅供参考，不构成投资建议
   - 遵守相关法律法规
   - 不输出买卖建议、目标价

## 📚 相关文档

- [README.md](README.md) - 项目说明
- [RELEASE.md](RELEASE.md) - 发布指南
- [CONTRIBUTING.md](CONTRIBUTING.md) - 贡献指南
- [SKILL.md](SKILL.md) - Skill 详细文档

## 🔗 相关链接

- [今日投资数据市场](https://data-api.investoday.net)
- [获取 API Key](https://data-api.investoday.net/login)
- [API 文档](https://data-api.investoday.net/hub?url=%2Fapidocs%2Fai-native-financial-data)
- [ClawHub](https://clawhub.com)
- [Cursor Skills](https://docs.cursor.com/context/skills)

## 📄 许可证

MIT License - 详见 [LICENSE](LICENSE)

---

**发布完成后，记得：**

1. ✅ 更新 README.md 中的仓库链接
2. ✅ 测试安装流程是否顺畅
3. ✅ 创建一个示例输出截图
4. ✅ 在社交媒体/社区分享

祝发布顺利！🎉
