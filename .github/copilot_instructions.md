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
  - The PR description must include a summary of the changes made, formatted using HTML tags.
  - Add the label `runtest:all:stable` to the PR.
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
   - Push changes and create a PR with an HTML-formatted description.
   - Add the label `runtest:all:stable` to the PR.
7. **After each step:**
   - Provide a summary and prompt for the next step.
   - Ask if the user wants to continue.
8. **Repeat until all steps are complete.**

## 8. Additional Notes
- Preserve any existing instructions in this file.
- Ensure instructions are complete, clear, and exhaustive.
- Do not modify any files that are prohibited by these instructions.
