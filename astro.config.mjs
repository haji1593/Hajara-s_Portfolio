// @ts-check
import { defineConfig } from "astro/config";

// Deployed to GitHub Pages at:
//   https://haji1593.github.io/Hajara-s_Portfolio/
// `base` must match the repo name exactly. All internal links/assets are
// prefixed with this base via the withBase() helper in src/data/site.ts.
export default defineConfig({
  site: "https://haji1593.github.io",
  base: "/Hajara-s_Portfolio",
});
