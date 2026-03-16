# 发布指南

本指南帮助您将股票情绪分析 Skills 发布到 GitHub。

## 目录结构

```
stock-sentiment-analysis/
├── .github/
│   └── workflows/
│       └── package-skills.yml    # GitHub Actions 工作流
├── skills/
│   ├── SKILL.md                  # Skill 主文件
│   ├── scripts/
│   │   └── call_api.py           # API 调用脚本
│   └── references/               # 接口文档（可选）
├── .env.example                  # 环境变量示例
├── .gitignore                    # Git 忽略文件
├── README.md                     # 项目说明
├── requirements.txt              # Python 依赖
├── _meta.json                    # 元数据
└── .clawhub                      # ClawHub 锁文件
```

## 发布步骤

### 1. 创建 GitHub 仓库

1. 访问 https://github.com/new
2. 仓库名称：`stock-sentiment-analysis-skills`
3. 描述：股票情绪分析 Agent Skills
4. 选择公开仓库
5. **不要**勾选"Add a README file"

### 2. 推送代码

```bash
cd skills/stock-sentiment-analysis

# 初始化 Git
git init

# 添加远程仓库（替换为您的仓库地址）
git remote add origin https://github.com/YOUR_USERNAME/stock-sentiment-analysis-skills.git

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Stock Sentiment Analysis Skills"

# 推送
git branch -M main
git push -u origin main
```

### 3. 配置 API Key（可选）

如果需要通过 GitHub Actions 自动发布到 ClawHub：

1. 在 GitHub 仓库 Settings → Secrets and variables → Actions
2. 添加以下 Secrets：
   - `CLAWHUB_TOKEN`: 您的 ClawHub API Token

### 4. 创建 Release（可选）

```bash
# 打标签
git tag -a v1.0.0 -m "Release version 1.0.0"

# 推送标签
git push origin --tags
```

GitHub Actions 会自动打包 Skills 并上传到 Release。

## 用户安装方式

### 方式一：手动安装

```bash
# 克隆或下载仓库
git clone https://github.com/YOUR_USERNAME/stock-sentiment-analysis-skills.git

# 安装依赖
cd stock-sentiment-analysis-skills
pip install -r requirements.txt

# 配置 API Key
cp .env.example .env
# 编辑 .env 填入 API Key

# 复制到 Skills 目录
cp -r skills/ ~/.cursor/skills/stock-sentiment-analysis/
```

### 方式二：通过 ClawHub

```bash
clawhub install stock-sentiment-analysis
```

## 更新维护

### 更新版本号

修改 `_meta.json` 中的 `version` 字段：

```json
{
  "version": "1.0.1"
}
```

### 更新文档

1. 修改 `README.md` 或 `SKILL.md`
2. 提交并推送：

```bash
git add .
git commit -m "docs: 更新使用说明"
git push
```

### 发布新版本

```bash
# 更新版本号
# 打标签
git tag -a v1.0.1 -m "Release version 1.0.1"
git push origin --tags
```

## 注意事项

1. **API Key 安全**：切勿将 `.env` 文件提交到 Git
2. **依赖管理**：如有新依赖，及时更新 `requirements.txt`
3. **兼容性**：确保与 Cursor、Claude Code 等平台兼容
4. **文档更新**：重大变更时更新 README 和 Release Notes

## 相关链接

- [Cursor Skills 文档](https://docs.cursor.com/context/skills)
- [Claude Code Skills](https://docs.anthropic.com/claude-code/skills)
- [ClawHub](https://clawhub.com)
- [今日投资数据市场](https://data-api.investoday.net)
