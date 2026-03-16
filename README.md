# 股票情绪分析 Skills

让 AI 大模型直接调用专业金融数据的 Agent Skill，对 A 股个股进行多维度情绪分析。基于**机构持股、融资融券、资金流向、新闻舆情、研报观点、实时行情**六层数据输出结构化情绪分析报告。

数据由 [今日投资数据市场](https://data-api.investoday.net) 提供，20 年金融数据积累，腾讯投资、毕马威 KPMG 金融科技 50 强认证。

---

## 快速开始

### 1. 获取 API Key

前往 [今日投资数据平台](https://data-api.investoday.net/login) 注册并创建 API Key。

### 2. 安装依赖

```bash
pip install -r requirements.txt
```

### 3. 配置 API Key

```bash
cp .env.example .env
# 编辑 .env，填入：INVESTODAY_API_KEY=your_key_here
```

### 4. 安装 Skill

将 `skills/` 目录复制到对应平台的 Skills 目录：

```bash
# Cursor — 个人级（适用所有项目）
cp -r skills/ ~/.cursor/skills/stock-sentiment-analysis/

# Cursor — 项目级
cp -r skills/ .cursor/skills/stock-sentiment-analysis/

# Claude Code
cp -r skills/ ~/.claude/skills/stock-sentiment-analysis/

# OpenClaw
cp -r skills/ ~/.openclaw/workspace/skills/stock-sentiment-analysis/
```

重启客户端后，AI 自动加载该 Skill。

---

## 功能特性

### 核心功能

- **六层情绪分析**：机构持股、融资融券、资金流向、新闻舆情、研报观点、实时行情
- **结构化报告输出**：一句话结论、情绪画像总览、亮点与风险、详细分析、观察点
- **自动意图识别**：自动识别股票代码/名称，标准化为 6 位 A 股代码
- **合规风控**：不输出买卖建议、目标价、交易指令，仅做情绪状态描述

### 分析维度

| 维度 | 数据窗口 | 核心指标 |
|------|----------|----------|
| 专业资金态度 | 近 8 季度 | 机构持股占比、基金持股变化、增减持方向 |
| 杠杆资金博弈 | 近 20 交易日 | 融资净买入、融资余额、融券余量、多空结构 |
| 主力资金流向 | 近 15 交易日 | 主力净流入、超大单方向、控盘比例 |
| 舆论情绪验证 | 近 30-90 天 | 公司/行业/宏观/行情新闻、研报观点 |
| 市场即时反馈 | 实时 | 个股涨跌幅、板块联动、成交量 |

---

## 使用示例

### 输入示例

```
分析 000977 情绪面
浪潮信息最近资金情绪怎么样
帮我看看 600519 的资金态度和新闻舆情
分析 sz000001 的情绪拐点
```

### 输出示例

```markdown
# 浪潮信息（000977）情绪分析报告

## 🧭 一句话结论
**公司当前整体情绪状态为中性偏积极，核心特征是机构持股稳定、融资情绪回暖，但主力资金流向反复。**

## 🪪 情绪画像总览

| 维度 | 观察重点 | 当前判断 |
|------|----------|----------|
| 专业资金态度 | 机构持股占比、基金持股变化 | 机构持股稳定，专业资金态度中性 |
| 杠杆资金博弈 | 融资净买入、融券余量 | 融资情绪回暖，杠杆资金偏多 |
| 主力资金流向 | 主力净流入、超大单方向 | 主力资金反复拉扯，方向不明确 |
| 舆论情绪验证 | 新闻与研报观点 | 舆情中性，机构观点分歧 |
| 市场即时反馈 | 个股与板块表现 | 市场反应一般 |

...
```

---

## 数据覆盖

本 Skill 调用以下 InvestToday MCP 工具（共 9 次固定调用）：

| 工具名 | 用途 | 调用次数 |
|--------|------|----------|
| `list_stock_institutional_holdings_stats` | 机构持股统计（近 8 季度） | 1 |
| `list_stock_margin_trade` | 融资融券交易明细（近 40 天） | 1 |
| `list_stock_daily_fund_flows` | 股票日资金流向（近 30 天） | 1 |
| `list_entity_related_news` | 实体相关新闻（公司/行业/宏观/行情） | 4 |
| `list_research_sentiment` | 研报舆情（近 90 天） | 1 |
| `get_stock_realtime_quote_merge` | 实时行情及板块联动 | 1 |

---

## 输出模板

报告严格遵循以下结构（7 个二级标题）：

1. **🧭 一句话结论** - 整体情绪状态与核心特征
2. **🪪 情绪画像总览** - 五维表格对比
3. **✅ 当前亮点** - 1-3 条积极信号
4. **⚠️ 当前风险** - 1-3 条风险因素
5. **🔍 详细情绪分析** - 五层深度解析
   - 专业资金态度
   - 杠杆资金博弈
   - 主力资金流向
   - 舆论情绪验证
   - 综合判断
6. **👀 下一期重点观察** - 1-3 个观察点
7. **🛡️ 风险提示** - 合规声明

---

## 合规说明

- ✅ 仅描述情绪状态、资金态度、验证关系
- ✅ 输出风险来源和后续观察点
- ❌ 不输出买卖建议、目标价、止盈止损
- ❌ 不输出仓位配置、短线操作建议
- ❌ 不展示内部评分、计算过程

> 本 Skill 提供的金融数据仅供参考，不构成投资建议。请遵守相关法律法规和交易所规定，合法合规使用数据。

---

## 相关链接

- [今日投资数据市场](https://data-api.investoday.net/hub?url=%2Fapidocs%2Fai-native-financial-data)
- [常见问题](https://data-api.investoday.net/hub?url=%2Fapidocs%2Ffaq)
- [联系我们](https://data-api.investoday.net/hub?url=%2Fapidocs%2Fcontact-me)

---

## License

MIT
