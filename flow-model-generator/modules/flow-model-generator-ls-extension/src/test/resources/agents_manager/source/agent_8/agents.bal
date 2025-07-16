import ballerinax/ai;

final ai:OpenAiProvider openAIAgentModel = check new (openAiApiKey, "gpt-4.1");
final ai:SystemPrompt prompt = {role: "Agent", instructions: "You will help with performing tasks related to data management."};
final ai:McpToolKit mcpToolkit = check new ai:McpToolKit("http://localhost:3000/mcp", permittedTools = (), info = {name: "MCP Server", version: ""});

final ai:Agent agent = check new (
    systemPrompt = prompt, maxIter = 10
, model = openAIAgentModel, tools = [mcpToolkit]
);
