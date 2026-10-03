# Technical Defaults

- **Stack**: static HTML/CSS in a single `index.html`; images in `assets/`. No build step.
- **Root sizing**: `html { font-size: 10px }`, so `1rem = 10px`.
- **Fonts**: PP Neue Montreal is licensed; fall back to Inter Tight (Google Fonts). The wordmark uses Jost.
- **External resources**: Google Fonts only; everything else inline or local.
- **Environment**: Windows 11, Git Bash plus PowerShell. No Python or Node. Use PowerShell `System.Drawing` (see `tools/*.ps1`) for image crops and diffs, and headless Chrome for renders.
- **Deployment**: automated static hosting (e.g. Netlify) — not configured yet.
