# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal portfolio for **Hajara Abdul Mumin**, targeting **Data Scientist / ML Engineer**
roles. Built with **Astro** (no UI framework, no Tailwind) and hand-written CSS.
Dark, technical aesthetic. Static — deploys to any static host.

Deliberate scope constraints (do not violate without being asked):
- Public-facing roles are **Data Scientist** and **ML Engineer** only. AI / RAG /
  LangGraph work is intentionally kept **off** the site.
- **No GPA and no honours classification** anywhere (Education shows degree,
  university, expected date, and coursework only).
- Project write-ups must stay **truthful**. Unverified numbers are marked with the
  `‹TODO›` sentinel in the Markdown body so they are never published by accident —
  grep for `‹TODO` before any deploy.

## Commands

```bash
npm run dev        # local dev server at http://localhost:4321
npm run build      # production build to ./dist
npm run preview    # serve the built ./dist locally
```

There are no tests or linters configured. `npm run build` is the correctness gate —
it type-checks content frontmatter against the schema and fails on broken links to
collection entries.

## Architecture

Content-driven. The site is **data files + Markdown content + thin presentation**,
so editing content rarely means touching layout.

- **`src/data/site.ts`** — single source of truth for identity: name, roles,
  tagline, location, email, social links, résumé PDF path, and the nav array.
  Editing this updates the whole site. Values needing real input are marked `TODO`.

- **`src/content.config.ts`** — defines the one content collection, `projects`,
  via the glob loader, with a Zod schema. `category` is an enum
  (`NLP | Machine Learning | Analytics | Data Systems`); cards sort by the numeric
  `order` field; `featured: true` surfaces a project on the home page; `draft: true`
  hides it everywhere.

- **`src/content/projects/*.md`** — one file per project. **This is how you add a
  project: copy an existing `.md` and edit frontmatter + body.** Each body follows a
  Problem → Approach → Result → Why-it-matters shape. Covers are optional and live
  in `public/projects/`; with no cover, `ProjectCard` renders a letter fallback.

- **`src/layouts/Base.astro`** — HTML shell: fonts, meta/OG tags, `Nav`, `Footer`,
  and the inline IntersectionObserver that drives `.reveal` scroll animations
  (content is fully visible without JS — progressive enhancement).

- **`src/pages/`** — `index.astro` (hero + about + featured projects + contact),
  `projects/index.astro` (full grid), `projects/[...slug].astro` (detail page,
  generated per collection entry via `getStaticPaths`), `resume.astro`.

- **`src/styles/global.css`** — the design system. All colors, fonts, spacing, and
  shared classes (`.btn`, `.card`, `.tag`, `.eyebrow`, `.gradient-text`, `.reveal`)
  are CSS custom properties / utility classes here. **Re-skin the entire site by
  editing the `:root` tokens.** Component-specific styling lives in scoped `<style>`
  blocks inside each `.astro` file.

## Conventions

- Routing between project cards and detail pages uses the collection entry `id`
  (the Markdown filename without extension): `/projects/{id}`.
- New nav links go in the `nav` array in `src/data/site.ts`, not in `Nav.astro`.
- Keep dependencies minimal — this project intentionally avoids Tailwind and UI
  libraries because the host filesystem (OneDrive-synced) makes installs fragile.
