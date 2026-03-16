# 贡献指南

感谢您对股票情绪分析 Skills 的关注！欢迎贡献代码、文档或提出建议。

## 如何贡献

### 报告问题

发现 Bug 或有功能建议？请创建 [Issue](https://github.com/investoday-data/investoday-api-skills/issues)：

- **Bug 报告**：请提供详细的重现步骤、预期行为、实际行为
- **功能建议**：请说明使用场景和期望功能
- **文档问题**：指出需要改进的部分

### 提交代码

1. **Fork 本仓库**

2. **创建分支**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **进行修改**
   - 保持代码风格一致
   - 添加必要的注释
   - 更新相关文档

4. **测试**
   - 确保 SKILL.md 语法正确
   - 测试 MCP 工具调用正常
   - 验证输出格式符合规范

5. **提交**
   ```bash
   git add .
   git commit -m "feat: add your feature description"
   ```

6. **推送并创建 Pull Request**
   ```bash
   git push origin feature/your-feature-name
   ```

## 代码规范

### 提交信息格式

遵循 [Conventional Commits](https://www.conventionalcommits.org/)：

- `feat:` 新功能
- `fix:` Bug 修复
- `docs:` 文档更新
- `style:` 代码格式调整
- `refactor:` 代码重构
- `test:` 测试相关
- `chore:` 构建/工具/配置

### SKILL.md 规范

- 保持提示词清晰、结构化
- 遵循输出模板格式
- 确保 MCP 工具调用参数正确
- 合规声明不可省略

### 文档规范

- README.md 使用中文
- 代码示例需可运行
- 链接需有效

## 开发环境

### 前置要求

- Python 3.8+
- Node.js 16+（可选，用于 ClawHub CLI）
- Git

### 本地测试

1. 安装依赖
   ```bash
   pip install -r requirements.txt
   ```

2. 配置 API Key
   ```bash
   cp .env.example .env
   # 编辑 .env 填入 INVESTODAY_API_KEY
   ```

3. 测试 API 调用
   ```bash
   python scripts/call_api.py get_stock_realtime_quote_merge stockCode=000977
   ```

## 发布流程

### 版本管理

遵循 [Semantic Versioning](https://semver.org/)：

- **MAJOR** 不兼容的 API 变更
- **MINOR** 向后兼容的功能新增
- **PATCH** 向后兼容的问题修复

### 发布步骤

1. 更新版本号（`_meta.json`）
2. 更新 CHANGELOG.md（如有）
3. 提交并打标签
   ```bash
   git tag -a v1.0.0 -m "Release version 1.0.0"
   git push origin --tags
   ```

## 行为准则

- 尊重他人观点
- 对事不对人
- 欢迎建设性批评
- 保持友好和专业

## 许可证

MIT License - 详见 [LICENSE](LICENSE)

## 联系方式

- GitHub Issues: [提问](https://github.com/investoday-data/investoday-api-skills/issues)
- 今日投资官网：https://data-api.investoday.net

---

感谢您的贡献！🎉
