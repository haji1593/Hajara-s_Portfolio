// @ts-check
import { defineConfig } from "astro/config";

// Deployed to GitHub Pages.
// This config assumes the repo is named `haji1593.github.io` → served at the root
// URL below. If you use a DIFFERENT repo name (e.g. "portfolio"), also add:
//   base: "/portfolio",
// and the site will live at https://haji1593.github.io/portfolio/
export default defineConfig({
  site: "https://haji1593.github.io",
});
