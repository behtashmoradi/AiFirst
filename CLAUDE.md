# Project Brain & Guidelines

## 1. Project Overview & Architecture
* **Purpose**: Premium marketing website / application built with high-density design best practices [5].
* **Deployment**: Automated deployment configuration (e.g., Netlify) [5].
* **Design System**: Responsive layout with modern styling conventions [5, 6].

## 2. Core Screenshot Verification Loop (Workflow)
When provided with a reference screenshot and optional CSS style notes:
1. **Analyze Input**: Extract key design elements, component layouts, button styles, colors, and typography [86–87].
2. **Build HTML/CSS**: Generate or edit the codebase to match the target design [7].
3. **Render & Screenshot**: Take a screenshot of the newly rendered page [7, 8].
4. **Compare & Refine**: Compare the rendered screenshot side-by-side with the reference image, list all discrepancies (spacing, alignment, font weight, color contrasts), and automatically apply fixes until high visual fidelity (~95–99%) is achieved [69–70, 88, 93–94].
5. **Always Verify**: Never complete a design task without running through the visual screenshot verification loop [88–89, 120].

## 3. Project Guardrails (Primacy Rules)
* **Never delete** critical source or workspace files without explicit confirmation [9].
* **Do not** write long, conversational explanations; respond concisely and focus on code execution [10].
* **Avoid** adding full API docs or giant style guides into this file—keep information density high and under 500 lines [158–159, 163].

## 4. Modular Rules Breakdown
* `@rules/workflow.md`: Defines the task -> execute -> verify iteration loop [11].
* `@rules/technical_defaults.md`: Standard tech stack defaults, environment settings, and library rules [11].
* `@rules/design_rules.md`: Specific component styles, typography standards, and layout guidelines [11].