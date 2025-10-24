# Copilot Instructions for homebrew-habitat

## 1. Repository Folder Structure

```
/ (root)
  |-- .expeditor/
  |-- .git/
  |-- .github/
      |-- copilot_instructions.md
  |-- Formula/
      |-- hab.rb
  |-- README.md
```

## 2. Critical Instructions
- **Do not modify any `*.codegen.go` files.** If codegen files are present, they must not be changed.

## 3. Jira Integration
- When a Jira Id is provided, use the **atlassian-mcp-server MCP server** to fetch Jira issue details, read the story, and implement the task accordingly.

## 4. Unit Testing & Coverage
- Create unit test cases for all implementations.
- Ensure overall test coverage of the repository is always **greater than 80%**.

## 5. Pull Request Workflow
- When prompted to create a PR for changes:
  - Use the **GitHub CLI (`gh`)** to create a branch named after the Jira Id.
  - Push changes to this branch and create the PR.
  - The PR description must include a summary of the changes made, formatted using HTML tags, and include "This work was completed with AI assistance following Progress AI policies".
  - Add the labels `runtest:all:stable` and `ai-assisted` to the PR.
  - Create the `ai-assisted` label if it doesn't exist: `gh label create "ai-assisted" --color "9A4DFF" --description "Work completed with AI assistance following Progress AI policies" --force`
  - Do **not** reference `.profile` in any `gh` authentication steps.

## 6. Prompt-Based Task Execution
- All tasks should be performed in a **prompt-based** manner.
- After each step, provide a summary and prompt the user about the next step and remaining steps.
- Always ask if the user wants to continue with the next step.

## 7. Complete Workflow for Task Implementation
1. **Read the task prompt and requirements.**
2. **If a Jira Id is provided:**
   - Use the atlassian-mcp-server MCP server to fetch and read the Jira issue details.
   - Implement the task as described in the Jira story.
3. **Implement the required changes.**
   - Do not modify any prohibited files (e.g., `*.codegen.go`).
4. **Create unit tests** for all new/changed code.
   - Ensure repo coverage > 80%.
5. **Summarize the step and prompt for next action.**
6. **If prompted to create a PR:**
   - Use `gh` CLI to create a branch named after the Jira Id.
   - Push changes and create a PR with an HTML-formatted description including "This work was completed with AI assistance following Progress AI policies".
   - Add the labels `runtest:all:stable` and `ai-assisted` to the PR.
   - Create the `ai-assisted` label if it doesn't exist.
7. **Update JIRA Ticket (MANDATORY after PR creation):**
   - Use the atlassian-mcp-server tools to update the Jira ticket programmatically.
   - Set custom field `customfield_11170` ("Does this Work Include AI Assisted Code?") to "Yes".
   - Use correct field format: `{"customfield_11170": {"value": "Yes"}}`
   - Verify the field update was successful.
8. **After each step:**
   - Provide a summary and prompt for the next step.
   - Ask if the user wants to continue.
9. **Repeat until all steps are complete.**

## 8. JIRA Ticket Updates (MANDATORY)
After successful PR creation, **always** update the JIRA ticket:
- Use the atlassian-mcp-server MCP tools to programmatically update the Jira ticket.
- Set the custom field `customfield_11170` ("Does this Work Include AI Assisted Code?") to "Yes".
- **CRITICAL**: Use the correct field format: `{"customfield_11170": {"value": "Yes"}}`
- Verify that the field update was successful by confirming the response.

## 9. Additional Notes
- Preserve any existing instructions in this file.
- Ensure instructions are complete, clear, and exhaustive.
- Do not modify any files that are prohibited by these instructions.
