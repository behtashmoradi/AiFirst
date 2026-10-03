# Workflow: Screenshot Verification Loop

When given a reference screenshot (and optional CSS style notes):

1. **Analyze**: extract layout, components, button styles, colors and typography. Measure section bands with `tools/bands.ps1` and positions from full-resolution crops.
2. **Build**: write or edit HTML/CSS to match the reference.
3. **Render**: screenshot at the reference size with headless Chrome:
   ```sh
   "/c/Program Files/Google/Chrome/Application/chrome.exe" --headless=new --disable-gpu --hide-scrollbars \
     --force-device-scale-factor=1 --window-size=<refW>,<refH> --virtual-time-budget=6000 \
     --screenshot=<out.png> "file:///D:/AI/Project1/index.html"
   ```
   A tall window inflates `vh` units, so cap viewport-height sizes (e.g. `min(100vh, 74.4vw)`). Check mobile separately at a phone height (e.g. 500x900).
4. **Compare & refine**: run `tools/compare.ps1 -Ref <ref> -Out <render> -Prefix <cmp>` for side-by-side bands plus a similarity score. List discrepancies (spacing, alignment, font weight, color contrast) and fix them until fidelity is ~95–99%. Flat areas inflate the score, so always inspect the bands visually too.
5. **Always verify**: never finish a design task without running this loop.
