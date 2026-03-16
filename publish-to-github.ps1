# ============================================
# 股票情绪分析 Skills - GitHub 发布脚本
# ============================================
# 使用说明：
# 1. 在浏览器访问 https://github.com/new 创建仓库
# 2. 仓库名：stock-sentiment-analysis-skills
# 3. 设置为 Public
# 4. 不要勾选"Add a README file"
# 5. 点击"Create repository"
# 6. 然后运行下面的命令
# ============================================

# 设置变量（请替换 YOUR_USERNAME 为您的 GitHub 用户名）
$REPO_OWNER = "YOUR_USERNAME"
$REPO_NAME = "stock-sentiment-analysis-skills"
$REPO_URL = "https://github.com/$REPO_OWNER/$REPO_NAME.git"

# Skills 目录
$SKILLS_DIR = "C:\Users\guo\.openclaw\workspace\skills\stock-sentiment-analysis"

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "股票情绪分析 Skills - GitHub 发布工具" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# 检查目录是否存在
if (-not (Test-Path $SKILLS_DIR)) {
    Write-Host "❌ 错误：找不到 Skills 目录：$SKILLS_DIR" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Skills 目录存在：$SKILLS_DIR" -ForegroundColor Green
Write-Host ""

# 进入目录
Set-Location $SKILLS_DIR

# 检查是否已初始化 Git
if (-not (Test-Path ".git")) {
    Write-Host "📦 初始化 Git 仓库..." -ForegroundColor Yellow
    git init
} else {
    Write-Host "✅ Git 仓库已初始化" -ForegroundColor Green
}

# 添加所有文件
Write-Host "📝 添加所有文件..." -ForegroundColor Yellow
git add .

# 提交
Write-Host "💾 提交文件..." -ForegroundColor Yellow
git commit -m "Initial commit: Stock Sentiment Analysis Skills v1.0.0"

# 设置主分支
git branch -M main

# 添加远程仓库（如果已存在则先移除）
if (git remote get-url origin -ErrorAction SilentlyContinue) {
    Write-Host "🔄 更新远程仓库配置..." -ForegroundColor Yellow
    git remote set-url origin $REPO_URL
} else {
    Write-Host "🔗 添加远程仓库..." -ForegroundColor Yellow
    git remote add origin $REPO_URL
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "下一步操作：" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. 在浏览器打开：https://github.com/new" -ForegroundColor White
Write-Host "2. 创建仓库名：$REPO_NAME" -ForegroundColor White
Write-Host "3. 设置为 Public" -ForegroundColor White
Write-Host "4. 不要勾选 'Add a README file'" -ForegroundColor White
Write-Host "5. 点击 'Create repository'" -ForegroundColor White
Write-Host ""
Write-Host "完成后，运行以下命令推送代码：" -ForegroundColor Yellow
Write-Host ""
Write-Host "   git push -u origin main" -ForegroundColor Cyan
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
